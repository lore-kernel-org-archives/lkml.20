Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2623CB2F8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025197; cv=pass; b=gskPmiIBl7DU59XCqKe/ZVi45rQ4xFBk5HToQFCW3tNnUZYO+ZbEUGLHyoaFL34hZynB8WcoSJvFWW+bgqE3zfMR9nKa1+p6LCY9w9xYHeWkxhLYn/AE/rS+VbuLcxN92YFaRXbjjIozoyZsbuKD5YQS3rKE+XRxB1pKmILYvKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025197; c=relaxed/simple;
	bh=dVjw4ljiCFw+ESWsURmLdu8hWv/DpVWzvl8Lc62Ew7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVFg/bIqKLTZjc++RfrNEgX9Ibqzq8fZKHA26G2RVSh9korx7+PcwIQPG1GF7PPJTO9n4cXOG5r/ANWp0ZaI4IXNq+l5acTrtxWTD01cFPMP+vMs2/peuqG6nHPYqew7LNSo/OkTBnY78nKntGRZjaclUM574usNpv+LmalXj8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=suHkh6UL; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="suHkh6UL"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836c4474028so67327877b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789025192; cv=none;
        d=google.com; s=arc-20260327;
        b=AAKY+ZuFZLwQ+XmMrxz11ssvXX9HEEGUKJc8cx4Tz5NPmRsy1jfDcFu7w4f7uVScAt
         8jZe4cmTdHvtfuoHDXTCcaH/7/XDhAkWOln3tJSNwN2g+VijYXxcS9hb3Y8gWZJlsupB
         gXyyce6jrSvVUFxoi7i93xd31cCTyb02vWXA1CfRNzA5CTBGL7TghlPcS9oPEtXkzQRW
         7xnqO8L3jFWU8VVMN/y715rE8osevZY5z6Q5dZvHSVCa96/ROT5KZTyN3BoCNHOXT6KW
         2htY/Db1/54r7h58CtVRhcYHfmNGn5FqUFHA+ojxgluKqh3rAVSRPxGRCZt8Hu4/6nqO
         ebyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=;
        fh=Jr6RAlgZsCzsbL96R1hK8ZCxFN4em94pHPSQV2MEjQM=;
        b=osxitiGBMxCo8hhclmd0fWmL9mbZL1z4YYHf2dqvkfTZpdho1o0tfEqmdx4XDQ+2iD
         8xuSRCtj8uTmSjidR9TKPpyZ/SKAVfpIWJRFncmY56N1ZTrp2uL+lHMGYA6oV//I2pHK
         yniZWNL0W+DtXHSaOJuKhxeezV4i3pQrOxFxrbb7KPsu69uGSHSs1NZawWsyzTKru6uw
         8fwUn1WerPR055yT3IP5+gZP6iT+SU7IncGiTFjUFrJHjdNsANF5z/namJ1zxZ4O2cD3
         xok7U2t+bjHdLDw20JxjSzf6GMAwUP0F7waSm6XaOwf1H0F8RLQJeAICfIw1cBEoQtqe
         tkqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789025192; x=1789629992; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=;
        b=suHkh6ULwnDEWuDq436Z0xkKK71gJkFK5kmNpji9DlmfxQ5sg6C3wx1SaMmP/hGw9r
         nMzsMW3AJhSurvDdseK61b388tLYVv/KE1m8IVKsI+cCEe0LjMhWqdlNjE7heQ1CvMPX
         2iDyssSW8uJoF1oYtyIjgzL64c7gwbna6Is3NmFQVRnTogqO6vIme6ZQvBxqRhsgne11
         T3RBsGh6Rc3859z5Cqk64eMxHkhCATZn/B2eu4/zZBIYgzkhQbNXI/vHhW0WXJcFhA0u
         KdxakDtzeD2BwwLbkXKsjpeoTbZkpD/G6+ATxRurL6Tlb8mFv+j3Q1GkoXNk+8dl3o+L
         BV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025192; x=1789629992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXglpmyQqtm2vQGfMHWvnjy2MGvK+hpILt4Bijo3TU=;
        b=MIYQQc5GAsVWHP7BFFU+/I22aPxJ5XmanTXCpUwvyRhAJOGWvtC+tNwIHCn1KhSK6Y
         UTZ4fKHKhq2ytqVQXP3n96UyjGOknHXWtjHUY5QHw/f7EgpsSmWlsSrZE3Hrm3ZUJGTv
         P3E8BEkmzmYyLVKQvDxQSZYcMxviVyayg9tKFy8cORX9JnDyBpEVs4iJTN8f6+4j4JvM
         CjvcHWx/FMdFXmDP7BlhfqSmDlFolVXzZ0rzr7qXmDpQvm3vsmjL7nHr1KdpsVUcqW1v
         cBvT0mUeY0AprUJggsUiBVOgWXxrmG6KVkMBRhZySaRU5Zx/Ub2sFfkK89wpGwebdB7J
         CUWw==
X-Forwarded-Encrypted: i=1; AKwUvBygQg+LesNoad27pCPXIjF4TkBpqdJ1D0ovrVWKYPfBcQg4j0wyeux8AeY2HoBEs9ft1x3xY/yIYThqTHc=@vger.kernel.org
X-Gm-Message-State: AFuF++l5lnqpL5bfK+Pa+b0mZlHdmtrBiINlfmN2HxJc180Ky374uG8p
	BhVZfvyfiTIXQwo25ydkAOvv/ZLZsd37uRLB6zcflGl5+4RXoXUqYSWdhXFDpunxmkXlSo8Y8Fb
	EMw9k4ubvQSDFZRsEAvI3VJxUZ8G5yOhf/ZJDHNs8vSuXwE4VpjBTDuwkML6pomcm
X-Gm-Gg: AYBFou198ZJZvqdu2ZYZIduQVwJN+8q8nc+7uQyF5rP/1uhhcIvvd8H699nvQPSWdi7
	rYf4jx2xlSMQMtX28j++VXpPM+ApnRPgwrMwaBXqd9maRxfzVFyWda/m1GVHgUd4Ak+jsqWTet7
	Y405xHVWdl3kJ38N8ygDHAYf8pLvDM8GRAjikD/C8qMQaZyZSAMmhXu3FngNQkXbag0tDLt2wru
	TGdQGZL712oMDb+q9qbVWFUzmBXdjm2XCItCyIgxGskFK8uC5Q9HWSAl4QCbiXjwP5xahQesNKR
	idZY5BKkyr3hPvjMF2ZA8xIWLxqUv4IN7sNK+zT7A6mSahIvp9LG7q8nxRdI1hli1QzZ9g9iHvG
	m11Z63koTPZW1KnaiRBNrGmgE4Mnp9tFG9eOOKKmOUnYF9/vDJ+wEKGjyu48q8LIdK0e3UXcy5T
	DzefhWTItiWgIUV3IFia64H0jiHLkH6wDf79gbeYjhx2crT7i1nyQhAqRY1Azou3R818KvnMB9L
	JC+Cavqa4I9YSqOaL/L5nEJtZhOWYnnEYPzQShgCirmH/ZT5KKfE4nl0EX8eng72211JcGfNZMs
	FYa43T3x8QUsxWWGPZHO3GJb
X-Received: by 2002:a05:690c:e28a:10b0:873:5bb2:6c0a with SMTP id
 00721157ae682-8735bb26e53mr93150277b3.52.1789025191861; Thu, 10 Sep 2026
 00:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910071838.1983652-1-julius@bairaktaris.de>
In-Reply-To: <20260910071838.1983652-1-julius@bairaktaris.de>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Thu, 10 Sep 2026 07:25:56 +0000
X-Gm-Features: AcwNN1WlZOuuaCW-CiTDQ_naRpa8Ngn8cqeQa6DliN7h_89pveR3c7oHeLWNBjo
Message-ID: <CAC1t37+f7+CJ+kBSe25g31fMWE65hme1m1gvB7ZZ_Ydvmce4vQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: request firmware-2.bin directly
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This doesn't change functionality, but log lines like

    Could not find firmware /lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin

confuse the average user.

linux-firmware does not ship firmware-2.bin for IPQ5424. I don't have the
hardware, so the fix would be unverified there. Would you like the same
change for ath12k?

Julius

Am Do., 10. Sept. 2026 um 07:18 Uhr schrieb Julius Bairaktaris
<julius@bairaktaris.de>:
>
> ath11k treats firmware-2.bin as optional and falls back to API 1 when
> the file is not present. Request it with request_firmware_direct(),
> which does not fall back to the userspace firmware helper.
>
> Closes: https://github.com/openwrt/openwrt/issues/24743
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
> index ef1b4c81843a..88ec2ffd9f00 100644
> --- a/drivers/net/wireless/ath/ath11k/fw.c
> +++ b/drivers/net/wireless/ath/ath11k/fw.c
> @@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
>         struct ath11k_fw_ie *hdr;
>         const u8 *data;
>         __le32 *timestamp;
> +       char path[100];
>
> -       ab->fw.fw = ath11k_core_firmware_request(ab, name);
> -       if (IS_ERR(ab->fw.fw)) {
> -               ret = PTR_ERR(ab->fw.fw);
> +       ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
> +
> +       ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
> +       if (ret) {
>                 ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
>                 ab->fw.fw = NULL;
>                 return ret;
> --
> 2.53.0
>
