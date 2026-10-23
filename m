Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758876;
	b=u9iHHOmeWRrHQ0vritqdcO/oTggkc04yNIeuXh0uZoHfL3ovP3aRjg2ilRuZBAi+Optz
	 tJhyvx5j70PWWolIaW1TeXmXxKNh+3YZT45njFmchuRfLG2Mye6ibGTYWWMM9bGkTzqG2
	 7w4hJd3sDjIZ2EQEy19Nq69yeWa3ts+2/rnEmmX1kr/+K7DkrF0JTm8sXVI1HFw4Dhsdx
	 U5nUld0zRgKKyKnTnaqi3uQJCUVPHYKUMfSz7EmY2TQIJidWE6VjP8Jh7UNykjPO3OKB0
	 TJ36lZjORx5fK79r2l3SrkKHQ56Awkjy/d5hyYJqG3RYJHilwrHUHrI3KdSfl/pLCEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GbI9dWRYHQC4FFZk8/mMBImcoolC/UhXap4+Lg16pBQ=;
	b=Q4ZD3tU2BiTGEj/JV+k8eDhYGu08gX33VhEeEXdHvxAc9PdAUR0XFmNPN4a0ffqGqK+a
	 Nu71qpVKrdmcK/BP5aO30DUiSDH232WNxaJQIsjYuDnmz1rrHrd2QhwgxWDBGcVG2mUJ5
	 SbUtbCtdwtFU7S+jB3JgSE82azK6AH9cplYK0hY6H8ItYgVPwvq32dkLtCuLrTNas7Djd
	 /cv18/GHxsFkJ8lGSNoBzAUoA01g7OM0vf0ztWCkATY7oznh+ZaoVQhE7xy9rhaVDjNGs
	 l0DCWJpormZv5mpAD/MXGPx+5RkCWx7FlVTmF2aMkwk1l+6pYaBUi1efZMtmT2ZzhJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ePFoj4Ji;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE464606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE464606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ePFoj4Ji
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so447486a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758875; x=1793363675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbI9dWRYHQC4FFZk8/mMBImcoolC/UhXap4+Lg16pBQ=;
        b=ePFoj4Ji6UHC64tiavSfZtLS19cFHWa1RIj49Ihu0WgCjTj2eFsnrdkfPYSD0DN3xl
         gfhn9yka82e7p/ZwJZurTV6x4+I5M6k7+zBV3NCM2SYWIEYyWz9Vjt9lLNBvmXFXkmOo
         rPUA/V2XXYemSU0f8ranX3yXG5eKLF0HZ45o6NsHSCVMs7S5tr26XFER5LWndeIhtzPo
         XY7uAMvzrmYoKR6AUkGtV6ialZhpJBCVsMV6fyTcNCwaw41H95tIV1kVgXseYcAbzPyd
         ofgcIIsVMRys77aeNnETAAplDW9ALACdWziyrrZni/7WXxpUMshhY0eeFxTA35STSbba
         6H3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758875; x=1793363675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbI9dWRYHQC4FFZk8/mMBImcoolC/UhXap4+Lg16pBQ=;
        b=r7UxBTaCf/nKzUHnIbcnQBjLIl3+gW7urTAkrZnGWKiPmY1KaPMf2cj5L0lGEkOY8b
         9VjLDqOYv+cQ1j/IAXJlCl66ThCTax8eb9Ip00K6+w/nogrl7Lb2TY9mVVzI4XTK9uJD
         vdw5/MSkPwt+DFvx2j7xhLAG+OpZPW6os3jwVs8IgD72ftYL2AWGF7Q5f3ZAZz5CCMHK
         8/k4jJLLIHP5GI93UdgIQo17XF/t3Y1xxBhKW2tEoOPOmPlnRy2noVDUj3JZ2xgnBZTJ
         VyiAIcB6Vlrcb4SLADKkzVwabhk0v9Qbr/He7x99hiuuiIv8qfzPrqQ5wbFTivUTWxcq
         5q3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+kYG5YZM0P6mB2DgqWd6zrJQrW0hg35IV//5yfS035AYLy33GTlq5Tfqtk6AXkIRcgBztFEGNp6VFje4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB5oAEpP+9cMaVT+UhTN7cusaDynPtNKdZ1aM338AgDED4gTuB
	e43McTKWRpYQ7WczC2uL9GWQY6eqd0f+DNP8WsGu42Qlt/SS3Q/xGgA4
X-Gm-Gg: AYBFou3+LKsSTiIoxMsq+JTYsr4fdSnBJ64Vl/pEFTldSmc8ncsWLkcoQyKklIXLq8f
	DQbIMT6fINVAUFIMmPL8u34jvLuMwu6lfT0ewiKNlK/6Sg6AUzP/Ha5xDLg/0DijfHm91kDBmAA
	9uQHalBq9u3f4Atiq8aa162z3iCmPUPldDpyLTP72G+TUHYvtlox7mIgYGpTSP59AOxQQG09cN/
	HncBIwQ0sRROTowgbAxtJGkh57Nen80PN0Jeo7Bd+3vcrP2rKfGPhieH7iTmA/MdDehy6bbzMtO
	bB0UKRewsnPu9cRilqZI6QVnEEjS1Qwm4cy4n6huaXgUNS42/25xhdvF3DInejLt/btsfgx3IPW
	D2pjARXl4o0fsz1coILC/zbVG4kEjifoATcd99QdcXhRNNiXnprereaWAAEdnxKl+ZW0eV2W42B
	srleVxgUh1sj8gtyET4vQFmcxBP3kfJeDgIaqmJmXINkWXeJTsGXb2SAz+bAeAh+QfT3F0+ekkd
	b5lT6bivGMu9To+QjOghRDMoyVu87I8ZUlo9+35Zg3r1f+ueAOCLnp3vuS7VHOF2c0NFO8=
X-Received: by 2002:a17:90a:d007:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3adce02dfbdmr1807811a91.29.1792758875260;
        Fri, 23 Oct 2026 05:34:35 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd8864f0sm110001a91.17.2026.10.23.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:34:34 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mani@kernel.org,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	bvanassche@acm.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Reprogram ESI after a host controller reset
Date: Fri, 23 Oct 2026 21:34:29 +0900
Message-ID: <20261023123429.1967-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <a3298437-21c9-4b91-94f0-417d92045afc@oss.qualcomm.com>
References: <20261022165006.1275-1-26rote@gmail.com> <a3298437-21c9-4b91-94f0-417d92045afc@oss.qualcomm.com>
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

On 10/23/26 9:45 AM, Konrad Dybcio wrote:
> I'm not sure it's related, but with this change, do you still need
>
> https://lore.kernel.org/linux-arm-msm/20261007143716.2161-1-26rote@gmail.com/
>
> ?

Yes, they fix different problems.

With MCQ enabled (which needs DT changes not yet upstream for
Kaanapali) and without FORCE_MEM_CORE_ON on the UFS PHY AXI clock, the
MCQ configuration is not retained over s2idle. The first command after
resume then triggers an SMMU fault and the error handler resets the
host; on my device that happened on almost every resume. With the clock
patch the configuration is retained, and I have not seen a reset over
s2idle since.

This patch is about any host reset, e.g. from the error handler after a
UIC error: the reset clears the ESI registers, and ufs_qcom_config_esi()
does not program them again, so completions fall back to the legacy
interrupt. It does nothing about the s2idle faults themselves.

Thanks,
Joonhoe Kim
