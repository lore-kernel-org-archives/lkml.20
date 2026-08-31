Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2593D952F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172048; cv=none; b=FCVEbW9pv9jfjcwkdKEzS3+PSdnG5VVlmuJK/MzYiX1Ft2g910MVznIdz7aeHTI2N0A1osLePKkPDXwKhw3dTFrUuOt3fWkk8RmJcwkov03yJbxeyUnHUa552n70s4EnIPfAwAXldDzx+IFCWnYN0iSarfh+7vatjJKYLb/uPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172048; c=relaxed/simple;
	bh=Q9UNHoecROtPaQiLQsMqsFJ37l8ESBY5tWC76cAlEw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSXZWusYXoinoPdxMYjQHCav0cdDMvEwN5ZW9F1K1FY/cScDXGtQaP7sLJf4/1vZgzWOAyAMTcAcpUSZ+nQWJCSeBTuxR2mAWB0FABF/jv2/YDWujFMXQlPbFjucA628FeMjQNHfrlTsHBJ5GA4c6VagqQSvi2F++5oGkkv5Av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCYzUFi+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCYzUFi+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso32667605e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788172045; x=1788776845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lT1qQQf3sNAXskUhzvBOK+ZfyN55r+y/3b2wCQVAtnU=;
        b=WCYzUFi+x9SfMJ5BalRvgkCLDRnUM38PVDXsqxLBGgdqK1mQ+wMi05i8fw4YT/2yDA
         1zK+ZS4Pdp4K1AYe5Ji/2FrNaWwclD8ODum4N2cBGn/ZkknSCWEDqGflUgAyAJ/BhloW
         ct5du6e8iK1woV1d1OfzRpO7y9sPmUppvSwY80WedTmV8ID20iUc47NEqYkMtG0AKcL/
         BmbPgmGLryXDE6AdaYaQGEljKwY2sJgvJA/B2xGbSEYsdk9jhfzPl+sSDm0B8o1gf3cC
         ziC6wuEc4lR6EidxTRjTUpblndJz70AfPS967b0EJsJS58XQGow9Caqc6NMdrSn7wbyj
         0xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788172045; x=1788776845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lT1qQQf3sNAXskUhzvBOK+ZfyN55r+y/3b2wCQVAtnU=;
        b=fBBYJGIY8r5dnqegR7I7nnng/XZqraqMmm1JskR1EOf5+Ui7XZoyWaZYirNcnND+hg
         EbP8YgINF26d+xAJmyZF6Nt9eg5ujx3RkvUoapE5O1oE0yUs0WQAz6JolpVWljtW3Stx
         B8+1StpxZap+fweYjKGnHMYTxLGwU2yVeqnrlEi6kj5f9UBBvphadGCUX0fY9EVm7FEv
         eJjwgXkupGRWWp0WVKJ10HBmk7bgsdTrdlkKb5IbSrMJTI5xTWnv0RQO/oxx8ci4hOn+
         j7JUz4uKuKxYgkUXQ/fj7u3MfnVwzVbhNHf/Ft5xNhJ8UALV/Ec5O6U0bvmkuWzynYFq
         qZTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Uk6LTJxQMpcT7vZkq+p81OXCo2VOR4/86/akfbK89HboKAuACvFKANyESUZwvAYtgkUrA2iMix2IQIU=@vger.kernel.org
X-Gm-Message-State: AFuF++lUAXHCYSO6WNPMjl+UBzrpyu3rZgVYuscC1SpGqbLKr/AY0DWB
	iZz4URdrnUsgHUbWokOUiChZI8j0cs7XCHeXKwX/Gxrqia/ANI4Trno=
X-Gm-Gg: AR+sD103nO/vDsi+RShBAnJAIHbV0/Ovwe2p1lFkI3gSoJNgtkMbbtWrtjmDOPlqt4D
	k0KS8OKLtrTrCM9SwrsO4GnEsjZwW8n80m/xPfezbLjG31zdop1nNOYKug9MnMa7ju14dEr/TMi
	B7NEeUxev9xlUwOXwddqxQR3dgoKNiBJbELUGjh/xFwFkTjwf1KWViJ80Ren5DTUn5Tx1VRhkrP
	MB5EmTV8PC0qP64mDe92sBWYvglQV7EkyFnW9KwMS7/iCBuGAAcWXHOGVcNgV95gK28M7SqgOPP
	GHLewTBDtwGSZMW7sC9FFiAtzDZdOl9CXQ4yQ0FjuK1Cj2c7jpwDyjrS3O9Dx4hp20m6bC19YXP
	gOFx9X9TR5l3Wo+rZI2RqMV0ooECn3v9dLVusB7fhGnLNwUKpU1yfdQsRdW+Ti+EHTwohhXQ8Pw
	Wf1AMWWBNMXwm7rcSXDvkA6cBb9yhvNJXqXFsrd6HY+5FHyriP1Ghgos+6bPAhg5ssR4oVZI7x1
	W5vHdpoGHY9TSWV7mLMC9ojr2uLM5tHoqzayoiH2ybPj5AJyyBGr+s=
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id 5b1f17b1804b1-49b91c1df21mr423200195e9.3.1788172044349;
        Mon, 31 Aug 2026 03:27:24 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961939ddsm129217405e9.4.2026.08.31.03.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:27:23 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: int3472: discrete: 4-char GPIO supply name limit and unhandled vendor GPIO type 0x08 leave OV8865 unpowered (Surface Pro 7+)
Date: Mon, 31 Aug 2026 12:27:22 +0200
Message-ID: <20260831102722.37615-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <daa8e671-adb3-4b67-93c4-d3779985d89b@kernel.org>
References: <20260827232634.93131-1-dmanresa@gmail.com> <9b07fedf-57a4-4291-9db5-415dca5ad480@kernel.org> <20260830150025.268353-1-dmanresa@gmail.com> <daa8e671-adb3-4b67-93c4-d3779985d89b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 31 Aug 2026, Hans de Goede wrote:
> I wanted to review your patch for this, but that link does not work and
> lore.kernel.org does not have any patch with the mentioned title ?

You found the reason yourself a few minutes later on the patch thread: the
patch never reached the lists. A mail tooling error on my side was dropping
the Cc: headers on some sends (while keeping To:), so v1 went only to the
people named in To: and lore never saw it - hence the dead link. Same error
hit two of my replies on the ipu-bridge thread; all fixed now.

Resent as

  [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
  https://lore.kernel.org/platform-driver-x86/20260831102306.36610-1-dmanresa@gmail.com/

with platform-driver-x86 on Cc and your Reviewed-by collected - and thank you
for reviewing it from the direct copy despite the missing list posting.

D. Manresa <dmanresa@gmail.com>
