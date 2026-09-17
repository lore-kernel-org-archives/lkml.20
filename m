Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6002EEE8C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624553; cv=pass; b=UyRDWRMys7rXpoVkv4LiaTs2K9JaZi8fDnYt7pAQmaYDoJHcDbUp+F9CzIGMs1BYVxyaesFYiunm83ZfGIOZQSqahJ207/DEa1UnNYICXGsLk1va7PLGsnDEVaVyTbB9A9jBn0f3PphL7FoWEwnd7G/5h4GTEc/SdAGV5xlgHf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624553; c=relaxed/simple;
	bh=2M19jcpJB7iaoZ3X4Y35ux2/fOQ9sByXnP6IvdU3kiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDTE5k0l1jObZudi3pBKB4MRjgI28kOtK7N8NHCOLDe7cFcdIV/SD/L48of+eWxzEXvsVmnMHtm3oTOqc5o9vBfX2sM7Dv/Xs+JJNvPwmP/wB+2OOeaMIWdzVFhzZebp7Xf2aiCYaHI7M5aP37JGMqPC6auF4c9RAY5OQWEuVhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+HK5RyT; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+HK5RyT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso70337f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789624550; cv=none;
        d=google.com; s=arc-20260327;
        b=fAJ8l4/jdIeYSi1RjDdBrAuv7AGW1DdqzP80Ug2MeLsSY596eA20Z0dfsRjWUWBaHQ
         O47iykfI56FXvyo1ODBlDxRPrbd7pkyJPtqPm+fpf2F1Ks3n760rvznIL+HEilKYGXgO
         s9DMpeLF4SAUZ9X1JpAM5o12n6bmGwfk5eLWDqT7qa3NMvv/pjIJ+4BKDpa5lJVA+ZVd
         TnGGe9C++H8hb1m9XM4ceaZQXy7wLEtvJvh0l6M2PxyShU34SP5hRuujTYraeoIU0q9a
         qwgY4lQs2OQ6R8OuKr+RAH9kh+aq65zxgYRYD69nSO07zFxGXB9BIyfqHAhHAt+0nkqi
         VVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C2JDpDvxbkVszK8qUg2bwR78mCh70sLOIElXLTKIW20=;
        fh=5X9c5T/YIqdRg+wkTN3LcWRuEEM5kNIS/NMFvlz9NxU=;
        b=IkabbQ6TINm9gOGfXhdTFYRFjXzW8kmPQUqJrqeZt22aG/ZuuSi0hAVimiSMa+jhQA
         /y9S0NpjMBAbXaMN37Vl42RwdplvdmX4Mbhm50whut5g3TA/KJdFz1r1YRU660wZyzQp
         KCJQe06u1tYDRYSX6IzngJlZDf3vu7oKkbjO4glSdWJRngtZwscpmH44jFLjTZPJD642
         TJyb8gv+jiRPbymc2CfEcORJ/ArChdD+WKtq+WIrbO5SmbMm4tH5x8c9H9twUMwgxzU0
         VGAxW7StKLzrlR5OptN9CCR3jaaYA01OZMKtSn0hJaPBmu5H+NlHzz44xoKT2KHesEc+
         NX+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789624550; x=1790229350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C2JDpDvxbkVszK8qUg2bwR78mCh70sLOIElXLTKIW20=;
        b=p+HK5RyT1rUdmApeIdwPb8/sJzLalkaUi6B6f1/U97VDuNxCUqdpxraz/i30ZS/98Z
         V9djKkTc7fknqr0JP/8DtmmfirB51NUKkZkvpUqfPbwLBMAWBBzZBjWfti6n+pbzV+ZY
         mxz8s2Dw3TCjYxMHSxZG7LFhFeAtSNO1YYaOtqjnfMUgxkAkX839/LTRe6gsNogjYyEN
         YvReQQesiP+nYiR+jn0edtt4HK5KInZh/idL76PO0HLRiX0vJlMxE9R8cJuwoy+Gu4M6
         5vnsk8Bw4H+wz0FcpZ/cHVPPv4Uifk/eaAFB4v5CEys2MdWwILtHeMvTxePB4QvROE5U
         ND+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624550; x=1790229350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2JDpDvxbkVszK8qUg2bwR78mCh70sLOIElXLTKIW20=;
        b=ZeDVIvSRCGrXEUg9EDM2xtHriMv6RCMsPsaYtPC9IezmrmwB5/qK28b2vG0tR7rulE
         jKypE5Gqcqhz6yn64ab0Hf9yt3JFa0YZbArZ74ch66wRfJJpzcj0WkKspFJ1jtSol+TS
         GHJkL9Q56l9rk/b0jStJtyWl6tQUM270KE3Y5BbIcLIpu5mmodz00RFw4UC03mviLH+7
         mJASuAle2mMuNvo/VB422gib4SHOV1wWn1yKmvw4hVAnKT99zr32sbiEMXxmGosqdlTd
         jk4i+VNmnoLTci5xai83WljG8ljyx2peZ4ETjtXSEfYR3rxL4CH/64RYqRxm/9e81J9q
         xi2Q==
X-Forwarded-Encrypted: i=1; AKwUvByFKBRZnkJDsI2pfURhHz5b1oaecOi1tdcqIwnF6C7ULE7QTz7OPe54/P3BR/rYFsVIo8vkP862wkCtixA=@vger.kernel.org
X-Gm-Message-State: AFuF++lYCh0co9dVvorge1DoWCCfbbExq315q7vFeb9iTi9lezXeC95I
	/8H+epUewilE4Nta4xXpGAesfYnbh1SErnPUNHABfy5j+mjvNXO/g3jfofbzg0dLpsvyiPCF2J0
	CMWt3MJ45UWyVNIVYg7w7W/Ir6bcPaD4=
X-Gm-Gg: AYBFou2uGRstA+DO9GGEwqzLAHkGn+tVNUf+nnMO2+4d8oMttC+R8uDgyX8mUcnWCT+
	kZ33nD93UPTL+bsmdmzm+1s9gUmXNoZ8EmOOR6rFq0IUjv70ZIhL9Dvr6u3rehVmboxyzzozI0F
	XWaYUzHr7Sku8KjCVZMSihpMc0r5WAdTnYrI8HQe5gYIsd+ghiYjUIleWRrOsK7YEVjIPB74B9z
	T1ZRYhGEoNmjAKVZI1G+0vIMfFh4Un1LnO7WEHAtr1CkRAa8Qk/6MVbo2PvjHruUbSy5MoqXpGQ
	BmEOWbzk5MS86YdRc/nm/bkcsKY3uLhPgQCETcQT6a4otyz4yuQBdTCJ
X-Received: by 2002:a05:6000:480b:b0:486:e596:1253 with SMTP id
 ffacd0b85a97d-4870d0541dcmr6003777f8f.3.1789624549699; Wed, 16 Sep 2026
 22:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-8-chao@kernel.org>
 <CAHJ8P3+0jVMFp3YTse8fbUTSp+jjW+2czxp0NuD__sHG_7UNXQ@mail.gmail.com> <94731ef5-4c1b-4aed-9a03-ab63a4fc8a7c@kernel.org>
In-Reply-To: <94731ef5-4c1b-4aed-9a03-ab63a4fc8a7c@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 17 Sep 2026 13:55:13 +0800
X-Gm-Features: AcwNN1VguL-2228RZ6OpwQGLHkDRN7vvPudMJHrjoULo_3Tj7FNh3X8HxFnEdVo
Message-ID: <CAHJ8P3JTqtxKOr90B0fR6dFyNgPA6dAgPOxFNYtKpFP=nVWJNg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 07/12] f2fs: cache: use node cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8817=E6=97=A5=E5=91=
=A8=E5=9B=9B 10:55=E5=86=99=E9=81=93=EF=BC=9A
>
> On 9/16/26 17:15, Zhiguo Niu wrote:
> >>  static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
> >>                                 struct inode *inode, struct folio *fol=
io,
> >> -                               nid_t ino, enum page_type type, bool w=
riteback)
> >> +                               bool writeback)
> > Hi Chao,
> > seems this function just only handle DATA type now, so can we rename
> > it xxx_data_xxx for easy reading?
>
> Zhiguo,
>
> I rename it to __submit_merged_data_write_cond() for readability.
Hi Chao,
It is good to me.
Thanks!
>
> Thanks,
>
