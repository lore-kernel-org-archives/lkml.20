Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E63B994F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632923; cv=pass; b=Mhw4YVEi2cuxN30v+DI8Jpw10jtr+jLQFmjXcQC4Hlz9mVtM0sRfeuh7YsDolTz/L+WUaKoaWfKydcANaQs3EOQobAm4LzOHCR1oRdLvltbFSrTNbApubqxMJFhfn3XnHGy274cvMHo9RTq9DOSSS94bFzs2o68KM84ffrveEJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632923; c=relaxed/simple;
	bh=h7AIpQ2PRk23L86vKYSlNOSeOqSkSjG7f+kXehac0Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twf1x1XtDhdxs1Qn1FfsZ/grE9+CqmnbtTrInzauJ3kmUyOeyfJRf5Ifq5egBi1Dg81Wf+1v0mdnh74io2qVBU/sJkBtzMk3om22ngA/BVFy+KGIC/O0XXl9C2zqPY0bykGNKdC/9ffFnI0wVEo33CkW2dhltiSG5DhOqVBezjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R71RbCf7; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R71RbCf7"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767d286so4524471cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789632920; cv=none;
        d=google.com; s=arc-20260327;
        b=gdkUdSSWc16hwfmOOzz7Y3uxUFiqZJjv339qNBNuKyv/t+TuInOM1liB3L+lk7FNF+
         eBYEZvxR+5SZUyoEAgdN5cNI9G5c9+7ArH2aVzJNdtf+oRphzIDIUH8Gv1Dn6+DH3Zdc
         N5nc9KSWKaxugt96msT3yLc469iapADb4R3KuYbCY20T6eLHIvt92et4ma8rYRgp1+k1
         Kodhs+HeW/wbMBDbZvjLd+0GtoW9s0ziE8CAUn3kOkPaKPd+tmPoPa02s35hoU/lxRu8
         uF69lCTPrM4b75dKwKGVyeghYciF762HkFGcIZ7HzuiJgd8Rr0794dfAs9u4VRsOOlk2
         QTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q72xsg8VGEvdYIBjoWovFPXundGMPvI7pSSXetg40oc=;
        fh=1GtmH1sTEK1PD/ZNIGuLrZZAbIMfcKCSORnnWlU/ROM=;
        b=Kzc/99QfOCvYDg84Ic5e5Bzs5prDNDAo8DmDCWgOQvbnOfbp150eLGpe6uqpANmkMf
         Em0S0JSiy6PtgndtO8q8FAxxVJkw0AsSO/g1r2JVeA5UdCE5PJ09x0QPjAHRUgyqQ2Gv
         i2PHdeIac1ulq8vedK9AVauHehfCUg0mt1sHK25ojFUdS/xZBH+UEFrk0EKZ+Lc8PBR7
         E7e+CwcOv/78n5Ba17EPURrhxHFNeswzJLpdzlUIgrwtLIp2S7OyVmhIaV1atKtGNj7L
         sT9xLyQLVJ4wEaMkcUTFpUWvgeBoPIW+HLLe1sTftFhsGJK6BAeXlsGehDKoFNAVQH9Q
         fmaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789632920; x=1790237720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q72xsg8VGEvdYIBjoWovFPXundGMPvI7pSSXetg40oc=;
        b=R71RbCf7TvAzyDkNt7y5tH7T5W28do7llbDvM2tDwkTuHblQLFo9+8nVzPH4UifE5C
         5SVG5Jj++NFlScC3FY6HEgGwntjAfiCkSqApuEjvOanIsr/vA+eA6Da98LRADmOk243z
         vd92kXIF9YXpAUx7jDelvNeo3atd5gfAkjSKZWSzzN5cACuu0pgTs9qSd5FrwT4SaNvj
         vXuZt14HPK6A94sjIbP89y7JLhPXQ1Gh5evz3cGP++qa/tcn2ewSRjDWuOOOafY+DlgD
         Zq1CS6Q0Vtknrw/u4+9z9HuYBLVLLQ850woco9GF7zmOihzcPVKuou4IWaMbAeDBnI68
         ro+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632920; x=1790237720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q72xsg8VGEvdYIBjoWovFPXundGMPvI7pSSXetg40oc=;
        b=2h9n/cF3ZGbMrj5FRT/9UJwhfBC98vjfdQGG3G/8hP1TZAg/qpf8KiR9b10fV8oEl9
         28JUuYPTzxiNexUEIyvjnPqCUokmtqIFOoWX7Cv6IZ98aqBSZnOgnbGZcIca5r8pWGNh
         O2F/uWvsKcJKkqKw1wmCtHZhq7sFGJqExRyu1tYEqtkdqv5895kXpkh0Tz8vywhlscm/
         mhmakIOMa/J8CPQJovlrrXna7xUGzbjlYlv199V6jE1C0clWtX7T+0L5eyviVxdfDmCT
         /Z/0yl/u2CxfLU1FU6hlJyNZ2nZxHhsysmyRwGvNj2cHNZkyQAi2aGUezayjoZYhiNW7
         Gdxw==
X-Forwarded-Encrypted: i=1; AKwUvBwThvJoZrMU4kg4oSIeAsRYz/uwaGo3cL+m4UDL2CWDcleRC7xHfEGDzV975v4wu+yt+gRkZ0FDyVzWjwY=@vger.kernel.org
X-Gm-Message-State: AFuF++mTYOAZgYrpFoiPxaWQ84dl56KYEF7UU+k1W6YVZGOUGSmqIYmw
	V2LfiZ1AvnG1cqmgf/Jy5JWZ9+HKhamyaGM5LQMJAW9lC2mWZIdGKVxQewNdIokpF1Bl+HuAbao
	s9m2QU1wiW4+A7e5ZY00TxXZR1rwuKkY=
X-Gm-Gg: AYBFou037sO0qV1gZ+Ooa0BXyv87soSgIYjO0G4PlRmb5Av6yj+TVrGp8NBz1lFML4N
	++IfSQkXTUXhw2m1k5OBabmCrB1QcNWb04Szf/CfP1eNHIskEc+NuoXjH6JgwAQrjgb7r9vpaif
	BcarKGD6zG7rCmp4xxMK4LEwFmUwS/qQzyLDT7HmIysNH5vnYmhei2mMwM+AL9762kKgilDIrdg
	bO2bMIaMX/AVMN2kdIZPAnVYn+aQOLpBmtdWiEZviO4MnmAUnerzb8nebnbVQVGmVvnhzr/xdWj
	IdrORSkS9RDEOJg4PBxhKbf2LMYZL7qosHtyI3H2t78hO0OP3w03Uk0MXpAMUAh7fX8=
X-Received: by 2002:a05:622a:1c06:b0:530:fe5e:becf with SMTP id
 d75a77b69052e-5327eeab130mr97646871cf.39.1789632920415; Thu, 17 Sep 2026
 01:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917071931.8063-1-palaomer100@gmail.com> <aqubqzKGtpmDkX9W@stanley.mountain>
In-Reply-To: <aqubqzKGtpmDkX9W@stanley.mountain>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 11:14:58 +0300
X-Gm-Features: AcwNN1UVIF0mDjZkSVenAtExu2rN52ZwJmXiIuEv1dHUTQv4TI7j3pN-aKsNuQc
Message-ID: <CAKhZXnpwaZf3hF1XAbO6O4fJZFGoe5Lk5Qsck1N_TU-0B170fw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dan Carpenter <error27@gmail.com> wrote:
> These kinds of changes need to be tested.
>
> I don't love this checkpatch warning because it we reject almost all
> these patches.  If it were new code, presumably the person sending the
> patch would be able to test it...  But I guess it serves as a kind of
> lesson to not listen to checkpatch and also to search lore before
> sending stuff.
> https://lore.kernel.org/all/?q=LPS_Leave_check%20msleep
>
> regards,
> dan carpenter

Sorry for wasting your time.

I thought it was an issue.

You can drop my patch.

Best regards,
Omer PALA
