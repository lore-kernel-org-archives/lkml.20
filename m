Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE75399361
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211709; cv=pass; b=lAp0nLea/+AhfH4bfoTww5BXbc7nMEyW5d9fT/KmEiHW3K9Nqm2jfGpEqUmvedkszqRamu4FfA++4XTgkNjoWYoxv4IbKIkzaR7cehQEuN6NAoz11yMaMCq2O5lG1PkuU50tqXL6/wDTGH8IjuJDMJmz+3HgI7vSBSFyDXOtxww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211709; c=relaxed/simple;
	bh=bfNrL7XwYmUCxmPxgk5/2sdM6T6+oYFGe+D+rry6+yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jp0Gqpj+sRhkUT0aj+M1HlaWyGYJn1PeNMPBPETkNq6qXBIClQu7fxnWVvCqVZ/oFGx9Dk7Kw7aN+nW491uCYWGscE+/ySUo0CtegMpd68ccI5/wUd0BdlojUkYL9snokw/5ZjjPuv9Al51PeoH62kVX/jj1sZO8xPhOSqSDMFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SJyJQ7Jq; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SJyJQ7Jq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8f265cbe6so1259795ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788211706; cv=none;
        d=google.com; s=arc-20260327;
        b=VwtRXWxrIwMMKygyW/VEvEvpJbdw38MteiE8zk7tZvLh90tAD6M0C9RiCTOGsP6FiW
         UH0w9Ju8FK7UOKaUyniv3mG1g/IlMFPix9DPe9M0/E6qLzFI5eRLEHzwvbahrHs0p1Jc
         RrvZyDa6Zc5DHKD7xEX/lcK0rA4Y4oXg3qLGIgyfsdAYmpntkTqEng6QnB45qO886Df6
         3yqQn5EkLeMVuzlIVFnEWt7rbErC9kKTOT6aS3txNNcEb/5/Z0FUJhm/0hAxeHMUohW1
         ClOdq+QJI0sDs/Hn/a+CMHl7Bwbr9GfrPGiG/AagQWe+o85IA89FMICXwCC9I4pB0ABd
         dpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JsoDZnDnnjuhIjWwApu8K5QF0OsufRvTAlRhz2feA9k=;
        fh=5VoFMuiGdlkTCTn8agScjOjgdi0gE6YA+NitG9AE4kM=;
        b=QkOBilnNhQmdTPul3kTpzq2zEchO3XMYur9jEcS+19E/28agnTr67/EDNrfAy01Cg6
         myZL181thT8I+2uB3MeuIYx+GY3Hx3pD4nhTiPG5Gz5RyB/777uMX3S0S1/YZUuKFMFk
         8zo3GAeWrjEvvsDniGicoo0vJkJcRMGQhWvmHJruW7qqhRL9rPfPWgJC756vLKigA3u/
         pgluOm2BqXaPY+p00xxpI2WUugWjI3ReRN7khJ69FIc5CWQ9aqOaGKEZjT0nHxF5KsZn
         JSORvuuf9FWvPKfQ/fo6O5W2+NQR4WC2sUPlFEWPJrN+1fQ1lIW5aKGLsSRkWFp9s0v3
         EDJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788211706; x=1788816506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JsoDZnDnnjuhIjWwApu8K5QF0OsufRvTAlRhz2feA9k=;
        b=SJyJQ7JqrE7TcZPzOXt3OLwon7pelFjylGTAKsvrlf9it4Lyk5/yQthvO65CaJBr8b
         fVw58+kZrXoFtB8lydFCMsQkPaytpvw8CD9pSLLLwdve+d0rrcWZYPPWjg2iRFv/abK8
         wxjJnh743h9/+69fHMye5YnHqWLauxu3kscsWLdpV4OMbPoDq3eLEBQNVAsQA65CKrbS
         aYSiSGdjdF4iqDU6pS+QW664RjQjsX58jnzYtitV5OMr1Fku8HbW8weDhQXJWW/dJpw2
         YNOF8x/e0J1XJ+Cx1my9wtZEg1zFmjMf9GahQAsBIGm8+EqKcac4HFmYjejyTIXZjcDn
         eQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211706; x=1788816506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsoDZnDnnjuhIjWwApu8K5QF0OsufRvTAlRhz2feA9k=;
        b=k7EF6+U54ydsph/AC8Xubwurgw42oAya+Y0tUrsgmIcxj/PqWc0USHEMmvvgs521Me
         WUa6IheGGzPvwbQoGuWMXEsNfPyTkgfan611ZrMe49qHZEtqPEieWjM6oQGeUDbqBoo3
         PrdYnIfZvs2Kna6dV/nrpizKpe5B+Igb3QN0XmjzYIrrfMJ3dLDKLd0EDs0//b1xXP3N
         gnVOMe4BDKmBCm53HLVnIPESPbDCR2YfzyTvnefmIhTi2HorbFMH7elwGnD5W3Pmi8EE
         4ODBuiHFvwL+eNobi+YGdA4GKRnEU6KTVrMY2gj33pNzgP3AbaEOS3+710viRdkopx1J
         s0Zw==
X-Forwarded-Encrypted: i=1; AKwUvBz4Gljl2n7q53Hlwou2NMHoIS7KGTyAoIv8+qeGuSftKWks4hw11Xe9yv0lO15w8YbASgfVFrVQLri1sug=@vger.kernel.org
X-Gm-Message-State: AFuF++kNuOfrbqBj7rWlf4/05JUhazw+o26iQurSxTgmFJtuij1is+vy
	OoY71yO+/9SxLtMf55buvVjXOHvK55d/+ddF4ly//myBfG2CKTIwFkJK0Xk2FfncLnfPpP9bEWa
	cndXlM22ow6mbNlz791T307tBht05qZ8ePmDrFpm1
X-Gm-Gg: AYBFou0U/+AJg2F3NaTsICvqQDGPl5iJKN5hNZeYB2ITQBAEeu9j3STLa5qXbhITrUR
	qnN4uaHK+ikpn8fiL6Df6DMyEDvDZhiY9ijjkZH6TYcElv/BoxVG8vDS5YsAdDN404v350vm+a/
	8Rawly5xjwWJKTZvg6N58bkva4u5t46vkuio1WK/3j8xy9KNs+P44PnCuASstjlbGdaVulEOKrw
	L5sLjM3DmslM6ASY8wI8xN4iQTlzce1THWc2BfYxUo5Xlyctki0g6MCu5vAKTn9pxL5HYrt5NaK
	Umgp3GVN+pycnNv152Dhih+ONwHwcVg0jgNRSfb42xNe
X-Received: by 2002:a17:902:be02:b0:2d8:d4ce:9f37 with SMTP id
 d9443c01a7336-2d8d4cea3c8mr206776655ad.21.1788211705902; Mon, 31 Aug 2026
 14:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707080615.1235830-2-caixinchen1@huawei.com> <e94ebd7547b7c28a7caaf6948d3d4953@paul-moore.com>
In-Reply-To: <e94ebd7547b7c28a7caaf6948d3d4953@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Aug 2026 17:28:14 -0400
X-Gm-Features: AcwNN1VUodnldawlS_uqwoK_0s9F_ptNR9NaT6eAmgzNXN8aIg-3rz0MbKhy-Ec
Message-ID: <CAHC9VhQYZg1tuwBOqF3jw310U8SjhEvJn62zsFxbNNS4=MN19g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] security: Delete dumplicate assignment
To: Cai Xinchen <caixinchen1@huawei.com>, jmorris@namei.org, serge@hallyn.com, 
	amir73il@gmail.com, brauner@kernel.org
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:30=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Jul  7, 2026 Cai Xinchen <caixinchen1@huawei.com> wrote:
> >
> > Delete a blobs variable with duplicate assignment.
> >
> > Signed-off-by: Cai Xinchen <caixinchen1@huawei.com>
> > ---
> >  security/lsm_init.c | 1 -
> >  1 file changed, 1 deletion(-)
>
> Merged into lsm/dev-staging and I'll plan to move it to lsm/dev once the
> merge window closes, thanks!

This is now merged into lsm/dev, thanks again.

--=20
paul-moore.com
