Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775429;
	b=xc1AezU+s1S0b158iS1//4NrEmurfo8RPBgg+UuZKRO9M0nPFq6L3ZHqVTyoYpAvXlmK
	 RGZ286ChWTAYz3UeaBcst2MjdMpc04+RGhpLKJBb3IWfxo6Pb3Y8pPGVvYyb06Z4s+Qq5
	 B1S9X9juHXdOBz1KoGYFmnmBHFcL7JmnHCQ9qI4cP4zyLRvA/Hcc6WgtkdtZJ/sLxOlhU
	 2J8HarkfxY5EuztzIgeGTGOpYOe4Ztaxwp5RTnDmCqWfX+R/bvdFSUAivyGD5NVxWMlNs
	 W0DJilXXC7kkL97GbTr0MtjG0qmznApb6Wx45EcBQe6AXLRHUP1YIVqlG/xnbrQaSAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775429;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8P4b5E+9y4klpdSYw7qcoFUlENC1eV03+reFhgLjDA4=;
	b=tgB7J35Pbu9ZvOGbCG177bDBfRQAGwOZJPS5EHI9qht6Gms07oEknut7kRkV9g63uetV
	 6rFwyJ6+fFasxqAR1PJ0Uf401rsnrjb9iizGiV5NiUsystC8PWS6GYD6EtMNHW+sN+P4y
	 0TxjjEFMv5I2RX05j6sIzkXoqqw9ovCKsfq454IcUdjwvPI4JIyM82dEteXdijI4/oT6J
	 y2oNxhoMGOcHXkSugjQZo803x5nnjSAvdJnshaw5fP0vfan0LMKWnO07jkbWrV6dP8jlV
	 wcbUnHju6wZVwTgNERf5xnCBpsQ2Q1AsfWLID43K/zy61BMX3DWifjYJRGiqt3vUjYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wWVNsxOm;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652D9606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wWVNsxOm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wWVNsxOmHZ2MABATj2Phbx67xBbNXW/Gbf+8O6D3/pdzdtk/ez3wNVxF4mHvIQOy3axCknjv1Mf57
	 tx+ybBdNFFdfHtAxVBjvKqzodxA5QNEH7UMZES/+P6BWmb+lZcxaIQhGhMQNVS3FlbeH2sltd4zOzW
	 Br/p/fYBlExZWoWk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86aead73a8ae-3a59b;
	Wed, 04 Nov 2026 14:56:59 +0800 (CST)
X-RM-TRANSID:2ee86aead73a8ae-3a59b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56aead7395b1-17a7b;
	Wed, 04 Nov 2026 14:56:59 +0800 (CST)
X-RM-TRANSID:2ee56aead7395b1-17a7b
From: bajing@cmss.chinamobile.com
To: peterz@infradead.org,
	mingo@redhat.com
Cc: juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	bajing <bajing@cmss.chinamobile.com>
Subject: [PATCH] sched/cpupri: Return CPUPRI_INVALID for untracked priorities
Date: Wed,  4 Nov 2026 14:56:55 +0800
Message-ID: <20261104065655.21847-1-bajing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bajing <bajing@cmss.chinamobile.com>

convert_prio() maps task priorities to cpupri values through a switch
statement without a default case. Only CPUPRI_INVALID (-1) and
priorities in [0, MAX_RT_PRIO] are handled, but the function is called
with task_struct::prio values that can be as high as MAX_PRIO-1 (139)
for !RT tasks through cpupri_find_fitness().

If a priority outside the handled range is passed, the return value
is an uninitialized stack slot. Current call sites in rt.c guard
against passing non-RT tasks (cf. the comment before the
find_lowest_rq() call in push_rt_task()), but nothing in the cpupri
code itself enforces this, and the compiler cannot see through it,
reporting:

  kernel/sched/cpupri.c:45: 'cpupri' may be used uninitialized

Add a default case returning CPUPRI_INVALID, which is a well-defined
"no valid priority" value and makes cpupri_find_fitness() report that
no CPU was found, instead of iterating over a garbage number of
priority vectors.

Built with W=12, which confirms the warning is gone; no runtime
testing was done as the default case is not reachable with the
current callers.

Signed-off-by: bajing <bajing@cmss.chinamobile.com>
---
 kernel/sched/cpupri.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/cpupri.c b/kernel/sched/cpupri.c
index 8f2237e8b484..2e99d5b7b2be 100644
--- a/kernel/sched/cpupri.c
+++ b/kernel/sched/cpupri.c
@@ -60,6 +60,10 @@ static int convert_prio(int prio)
 	case MAX_RT_PRIO:
 		cpupri = CPUPRI_HIGHER;		/* 100 */
 		break;
+
+	default:
+		cpupri = CPUPRI_INVALID;
+		break;
 	}
 
 	return cpupri;
-- 
2.43.0



