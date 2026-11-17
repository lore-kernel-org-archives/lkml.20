Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.202.70.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918360;
	b=ee/weUsvt+r+sa6ESYXcIhePbIYf2Ne+mHPlZDYgc9DsD+ILXE3M7VpENhkXDYMFz0HE
	 V/plnfn5BITZNORb1EVK2s8Nzq234X1vrXL7i0gcWj42tFcCDpo/htrP8S1YDLFAZKMI3
	 Npt8vyZYI/ZsvRp9Tjl1cKz9dItSAcgbHnRxGzv3/ciL0oCoccDzclWyfgGbxUIo1jId1
	 piEIxzO4QhBUAEUYT82dp2NqbcuhHWBPt3rvggvjQfwYg1FNH1DSJHGNO515IgDiFtTpT
	 8TzXNt6jCCoYTZoq7NzuWv8DNa9lZ9fqbCmarWdff3GPlae+r6zy9sV6J9ZDGy+TdBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918360;
	h=DMARC-Filter:Received:Received:Received:Date:X-MD-Sfrom:X-MD-SrcIP:
	 From:To:Subject:Message-ID:Mail-Followup-To:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 DKIM-Signature;
	bh=OhZQsl2FCTQRzQuHMcBj6rGdLkYpWdzBsEWdZvLTZs4=;
	b=G9EDFaxnO699HRzHfYgw3WO5/UwQtrTrJrc3BlGj27OL36XWU/CoquQxHc6w4j28B6nb
	 s5SeyhEOfgPRwv4OqIhLoDVTtXHb58zaaj2D72AaswSNJwQVoJrfbk7Ilnrf+YtP9PMPZ
	 LaJkEuJqxtVzAuNTLn/Z1NVDGkvbVPZZTpmr+emIllLiiyboevfMim6YROi0XBs51tMrs
	 lXmBGC765fsNULrygZerIrs+TL9vL3EdWqP+FXXn0OStA1fGPw3U2vQ9KEN9eSewyuR0S
	 /sVJhD/Pa9yRzLkwNJNW3G4y6svZVZCAEdDu+NBq6JS/GAmxQWN9ck5rWxtL9oTBfLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=didiglobal.com;
	spf=pass smtp.mailfrom=didiglobal.com;
	dkim=pass header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=ggtD8JyN;
	arc=none smtp.remote-ip=111.202.70.125
Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9DA2F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA2F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=ggtD8JyN
Received: from mail.didiglobal.com (unknown [10.79.64.21])
	by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id B72CA191A83BEA;
	Tue, 17 Nov 2026 20:25:34 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ01-ACTMBX-02.didichuxing.com (10.79.64.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 17 Nov 2026 20:25:34 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 17 Nov 2026 20:25:33 +0800
Date: Tue, 17 Nov 2026 20:25:21 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.64.21
From: Jinke Han <jinkehan@didiglobal.com>
To: <linux-kernel@vger.kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <nik.borisov@suse.com>, <rppt@kernel.org>,
	<peterz@infradead.org>, <mhiramat@redhat.com>, <jinkehan@didiglobal.com>
Subject: [PATCH] x86/kprobes: Fix boundary check in insn_jump_into_range()
Message-ID: <20261117122521.GA17792@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: linux-kernel@vger.kernel.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, nik.borisov@suse.com,
	rppt@kernel.org, peterz@infradead.org, mhiramat@redhat.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BJ02-PUBMBX-01.didichuxing.com (10.79.65.22) To
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
	s=2026; t=1794918341;
	bh=OhZQsl2FCTQRzQuHMcBj6rGdLkYpWdzBsEWdZvLTZs4=;
	h=Date:From:To:Subject:Message-ID:Content-Type;
	b=ggtD8JyN3cNpzjuvYr31mrsg7iVwRTjKdEAbbSKuh9A7YAzF1HDUIizjpxykLcHvQ
	 nH4SLV9JNIFqkPfS//dVL3Vl5cTB/LeCalJdiy8J4WqgplboLF5vivGBmRM2zj1okc
	 S/uVBiiL1i7V4qDTLHGZY1UsH4mx1VoGHmaPyW4Q=

The range checked by insn_jump_into_range() is half-open:
[start, start + len). However, the current check treats the upper
bound as inclusive, so a jump target at `probe address +
JMP32_INSN_SIZE` is incorrectly considered to jump into the
optimized region.

A valid jump target must be an instruction boundary. A target at
`probe address + JMP32_INSN_SIZE` lies just outside the overwritten
region, so allow the jmp optimization in this case.

Fixes: c0f7ac3a9edde ("kprobes/x86: Support kprobes jump optimization on x86")
Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
---
 arch/x86/kernel/kprobes/opt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..a920ecb99381 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -252,7 +252,7 @@ static int insn_jump_into_range(struct insn *insn, unsigned long start, int len)
 	}
 	target = (unsigned long)insn->next_byte + insn->immediate.value;
 
-	return (start <= target && target <= start + len);
+	return (start <= target && target < start + len);
 }
 
 /* Decode whole function to ensure any instructions don't jump into target */
-- 
2.34.1

