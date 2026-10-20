Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525566;
	b=KudAONsAoHzgBZ7JQMErz+J4by5Ky2PhRQlfUTy/xwl0+o/bLTBVc94D9vsGHNazOpyA
	 jki6n63F88ok8GWZXOO468h1EzzrzZAFDp+Psh6EBEHM3Rvz+e5syDcwtvF6xN6cpSSde
	 yhxsazbZdu4wY0YdPqncyXwBO+wOFnB6FzlDrFFdVItkzHvaSvo7yJi+7NJL3wpG/7ibF
	 MfVP48X8njBRy8c13vXhTDYPKpXC3lynbK4qcpBpXhZRV33Mgi9UthHmTLbu+BPkMSw7A
	 GqHv975bLVZN93GM1Uf7Yswl8YxQiXnlqrKrYBc0OfCTlgkSrIn4TGsLDbz8syurlIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=0Dz/HJwUNOagY1cibG3m6O3ofOzpUbQLthWmzopo71w=;
	b=PSCoUry9o39PUE+9Y7/JfgFz+bsfp0XnQbFdgZ+7NTz+l/9b7pUsZzg7UJZuKfZI5Rfr
	 ChGrMmlll6zBLp6JrInLVwDdQ7IsEQucx6orpBVSGZ+s7E/bwh8PgUlgYuwplUK4xxu3J
	 ZhyiNpXMj4tGGOw/lfye4drtxp5+4jbdkri00tz5eSjAXtX6bAMGHQTlvejh+LO3A2N5b
	 GlGwrXCsYGi/h4AeXG+MYCnIBoHe70E8lglK2fdIF52p7C/5iTIQltgq35isju7vxrL7+
	 vozL0J4dTAo7HlcsbLyp56QMDl0xXMbL8vKtHnVR1jMb/NYJn5ShG/McpxI97P3wuXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G7JjI2I0;
	arc=none smtp.remote-ip=74.125.230.138
Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2779606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2779606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G7JjI2I0
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-91b81cce44fso770086d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525565; x=1793130365; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Dz/HJwUNOagY1cibG3m6O3ofOzpUbQLthWmzopo71w=;
        b=G7JjI2I0kSRfhJwoviEIb0sARcyrU8OjLKEDoXBRv55kViEau98lD025falnDP+3rI
         gq/9X/JZqOCyRPWfN/lJ/yHd43Q0O+f2fVIlNfRfrPH1XkOiq9kuoa61q9kgcNkdukXi
         4sGashUYcnXqWYpAxNOL80HCvtlUCFr/cFT3A7VhuKwqc/HQXdQoskvQiCuzg6kHOzgg
         Aw+IIoldLSRPFpZdDvfyvzRYdGltJFIA0xsaZMjHYihZLxeR/zo+2rCbDxutv0RKuJ6A
         9+ha+EQeQ7ED3BPHPn63oe2XhiPDUElQs6qj3OhKRSGJKEkOOVB8D+UM6yLiCByihj5g
         FjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525565; x=1793130365;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Dz/HJwUNOagY1cibG3m6O3ofOzpUbQLthWmzopo71w=;
        b=19K9a+pZ8XWcMzQXIUqUnp1IUpILetmxBPBbPKvM0PtDx/kdmS5qBPypU2B0Ica2Xt
         cOW46ct/4L+vgMML9Zy2NK+N4ktO8BnD813cqbEyFO73OQhqipUS2+K3JxMRDT7kl3Lb
         WJcpcd/IYjbyYrzsNRhenq70FAmuTRqtTeEIu9L4HzpO0Dk79iqz2Y0IBlfculNgbrKF
         PG3ZgJpvzjsUC2ZWTWp5Hwtkb3H6HK9Mm88EbiU/BC26R0AkZCmPc9VllTL8U61NllnI
         JcMUO80F0Q1BI9iACwzpn7BqDpNR5/u+kCCo0/FZFxtwe1h3tT/imZNt9Sh965M0lFE9
         WZvA==
X-Forwarded-Encrypted: i=1; AKwUvBwFJa+U13lfDaNllTTFzpQwLbvI1VX2Nug0+/7ffvwdGOX0Yrb8KLbAc0M/3RVeqknmIQo9JWM7RW3Di84=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjCFB4bVbMpz67AVSyWc4+xG4J01BP7hkiFuBqwG5upiYZ09sQ
	FZJycGW5SGSjAGkjSw0c6pCyAON4XXWGNGWK2+9MVo3ZyM/owp+Qwyev
X-Gm-Gg: AYBFou1CHM5GqR5vj7sputeoJRy1oAFz9Aix3etc0JnhkCUc9p88IZErEHznQtBOr2p
	dXfLJrRqrO+W84fVqlbYMI87Z0ekbcet6/ZiYr0w19F7nH/EWNhOHVGiXe1/iAg+HrAnJDf9+QU
	8OrLnVzePJ6HIbjfh0oIvhsj4YamqiQtji7iTwzJw9RPh5IqEK+rh4d8r/amIJctq25uf1aGUXP
	hj5FsAdOEYnPsdTIFi1Y3sgt2LtTnFt2A+7uW18+h+GnfD7BUQrCIwPQGx4kwYmekbHucoNiyp7
	w9Y0AIlMEoxOOTNp3iD4S2jmFbyljErmNXev8jHrlUmaBlkML7LyqIEjbFSxSMkLmuTRQElTYr0
	hHHkJSLvk+hhxWY5V9tiTg11EpPrNOh9s+PhWgRFQdQ6eL3be1tBLXDo0xXeyNAXQIDl6HW6ll1
	Uo2nq/C87QBTmG4ZoDP6oxJ/Jy8OAhsitZFNHmjUiPJ8ZNlcLs8ZP2MnbcUrkpukS4aD1PYS1Yh
	nWvReo=
X-Received: by 2002:a05:6214:2489:b0:917:1f8f:6d3a with SMTP id 6a1803df08f44-91bdf02224dmr210632286d6.17.1792525564731;
        Tue, 20 Oct 2026 12:46:04 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10b71583sm6336516d6.15.2026.10.20.12.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:46:04 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3] selftests/pidfd: wait for POLLHUP before reading exit info
Date: Tue, 20 Oct 2026 15:45:18 -0400
Message-ID: <179252551833.59967.6484153471898928809@gmail.com>
In-Reply-To: <atc59R5-oBnyOIb8@redhat.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
 <179234213014.649.6368924662349703640@gmail.com>
 <atc59R5-oBnyOIb8@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Oleg,

> Confused... V3 still changes the 1st poll(&pfd, 1, 0) to use POLLHUP?

You are right, and I'm sorry for the noise.  I fixed the source but
amended the commit without staging the fix, so the v3 patch still
carried the old hunk.  That was my mistake and it wasted your time.

v4 no longer touches that poll at all; only the polls that are followed
by PIDFD_GET_INFO wait for POLLHUP (and check POLLHUP in revents).  With
the corrected tree the tests pass ten consecutive runs.

Thanks for catching this,
fujo
