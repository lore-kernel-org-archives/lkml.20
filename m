Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613290;
	b=BonPFVUN2xeawJS3Fsqe9K3h2Wzj96CqGZtofCAs3lvLV/dmQt7Rr5KJLoMYcvG9hXNP
	 ySvs0tiEG6xmFrcFr2gDJ/ZKIq5o3M26TAX46BaWi3O/oglwY5DNLUK+jVVpc9c6hJUGI
	 6ftHd19EIwll/FJBQkycrvKtyjdUtEzTbkXq7tbogGqNrrFOnflZAZUb4XyE2Z/1wuzjP
	 Ju/nWPGRhDnMVHrwe6IYcuYqfAMMKBI6nn7Wg+3egynQhX55P2PuAnrXwD/c1oysbHRx5
	 0dJk9KbdxwOTZPhYCL5lD80K2fz1AZFtdNCL9JGW+w0I16GiY3jH5NxPjspX5XABb3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eoY0Ce+zIXviOGVXKcEuESzYd3gN7v+fOQcLylmkKcQ=;
	b=elsw+zYxQbF4ZkDavzlxHesSXzQw5uCqgE1uSyK88YtCINQdtcHb8ZyuiqPb0Wlai1cK
	 zXBXx6YYgxLk1CKBlMeE382tXEFhTYpSY2FROybyaQfjH62E+f9lDaNsKqBFTzN9/gaws
	 gvYmyQlbQjQ6n+7spZXCCHdRcXuabADxlSrVvwQQHQ3HR2zL9OhjL45jGY+Wmk8foPqNr
	 4mgw4shiwZvdlsEbXIVggmBpnHsXWg9HB8IarU4hvtAEgmOQVgVATcdgpVj5dKe3CzuuW
	 tULEbNYuDU/bX9+dS+pXTTP9v/HU1rDdIuN2WigAeRe0RfJLZJVJnP7RqDtPB3f04Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BO1DCqUd;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076A3606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076A3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BO1DCqUd
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so801201b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794613289; x=1795218089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoY0Ce+zIXviOGVXKcEuESzYd3gN7v+fOQcLylmkKcQ=;
        b=BO1DCqUdoI5EeWNE4IxpBasbkVnQpZUmrVobgUz9Fiblto1d8zpT/tmmybzkjOlQdM
         1QMJUlLplanMObhM2eUOOviwvptfRNvDWxT4bpseKT/eP5HanAm8K7ueeJXB52BeLLRD
         3l85RP3dERYeWJq1qsLWAxbTdOuYTYDyGnBvjYCGlx4al8nJ0Y0f8RC6JytCSFasj6cq
         J4VlM4aSLJVGndSL6xC6E7sp7B265UJrXJQlAhbPdZvg8bCgF6clOeTKfAZ3lvXN3A4L
         8ZZum4FMWKCZ+f9+Ty5Su9S6A/UwPlmUtni4Tk7kY5h2U12r5ZgL29WEvLgd1kHwPxNR
         GHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613289; x=1795218089;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoY0Ce+zIXviOGVXKcEuESzYd3gN7v+fOQcLylmkKcQ=;
        b=vcWL18yg4AkHH4d+0Xqhp+Vx3yFRLXYkQlDY1N6J/OB/feEnMtIfmiCYTrhoHsEMxL
         IBX5j4ANJGHtFqPMH88L0Tiq0nIXisuG2GG/5Y6k5TNIaIOQWo7hoyAD1vJawA6KJAFG
         TLQX98hfASOBvrBV47C8YUcdQ1Gs7PgUJJo6lhxoDdJ1Zz+dEPXSid4IGfifBs7pqNZl
         pAayFI9OwLmM7gTBHBYNgqXJFSbdvk+MxYz2VCJ8xGb8TVJduavm2EeP96VdCvDJ/q0S
         sw1MLQhXgmYgiAFvx3//2DDJSChqP28337JBOxKPBnUxGAhoBEuwLP2WSW8SFRWm5HMS
         C+bw==
X-Forwarded-Encrypted: i=1; AL+hErH7TH6MW2p9eeRQQaDhBQ4nDuSzqepdGvEIrKU6gIX9QqcAFANlCpH/UmLEK4hDWRpIlArxPs9fSF6mLjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cwVTSIgk8/SazvgiiuiwacQc7ATfRdodEsaTIUTIUXUwrCP28
	rXCmuurLnnPWP01eVVtC3oIr+huTlpVEz10M9irSaC+sXOP7SgGNpwyi/+8B79EbDg8=
X-Gm-Gg: AYBFou3wNo8uFl5mCl2GvaxZdTsq2+xxr5dWR+1xKS5eKo6NhQzWrTX4hIK97zdnsqt
	Y0NIm0Dx2qNNjc1sZtteBbCj8q9V2V2G4tDc1LwEec8R4hoHUU71wRE99RhArNx2ldt9gUm5Gkt
	HoMo+DQ9o5lCDc/tGLR0D120J4vmRT0kyybEPnvFWjDJI/Zvh0QktCOJKZ6F3EC6UJbPb9BB+/O
	mEb80cZ1PYk5HlHFE+4cLstESyCDjCJ+5ZkJnrIeR2+yIA0mWlfb1aN0GYGIjQWmF/UnXw9b3Ow
	/xFq5R8bk5Z89gy6xTgqVkNdm4zXlLpAUrIame4TZnsU2kjSJc232kmWnUFGuCwASWQ5jS2MVeo
	uR+xEENg3RcqDriERDCcJoAONSgxLaoc1Dx0GM9Qa9rAw90b2LZPQhWTOnvgKTDgjt6Asy+YewE
	LpBGgOryDPRadtfMldOZsV0mCnAQ0o5V8cNwQYPF/QCwZG+19gulYXAsgf7feY4tFc0JCGfaniE
	zCaUDpg4sCDPyBUKq84oKOBZQvA6uRaoH+jhqApJqNnfuKeh1V+fDn8Rx+/7KDUwBVLh+s9PjLn
	eiSt8VcJKhAHoN2ckaamJsSQYEuI0BO5fw18WykTeopmCdoPhsq1f6cH4pPN6CHAAx7wCsPUuLK
	u/R/zNxHochPa8yV575qAX80ijHRHKmGIepknUjs=
X-Received: by 2002:a05:6a20:9188:b0:3eb:9c9f:8b8e with SMTP id adf61e73a8af0-3f7a91e5a11mr3426778637.92.1794613289234;
        Fri, 13 Nov 2026 15:41:29 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed205364bsm1768831b3a.33.2026.11.13.15.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:41:28 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com,
	martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: libiscsi: only complete a task that has been sent
Date: Sat, 14 Nov 2026 08:41:20 +0900
Message-ID: <20261113234121.397606-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113145140.282504-1-yhlee@isslab.korea.ac.kr>
References: <20261113145140.282504-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v2, which is unchanged and now sent together with
the follow-up patch that depends on it:

https://lore.kernel.org/all/20261113233938.397415-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
