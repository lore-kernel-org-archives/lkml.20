Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A30A4E80CF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514454; cv=none; b=IYY0Ug7V5E2YLH1bzY/rsl6OU1Wzk0fxTEE2nFVgUcM71xMyOxHn1+9zzJuA7oDlZDt2rdiLYFBjWp5G4M3jlkHM5mDQ0HPQ3v68XJWiUpcmDqMz3qkhvl75/N0jOVDtkhSjLAZc4TTP+n681dAh2ejNAXAj89+LC4mEuJ6GMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514454; c=relaxed/simple;
	bh=gLdYmyRPQznQzGvIt3DowhuQFSJuK+S3Eax/cTpHIWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNIgBK8jYkxhpz/NM6BOoavFf+TCJToqhTSpmR1r4R8AUA9ycs7Wm4gTnX4cGSeS/du/JflahXf1jvyBzbkWk92DNJ7XAnHrBm6uapwjam681F9KMZo2ANIKueqhrycj8mvltX6F5ob/fXAbqsconPBTl2z0UecayYeOgBebcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c779SqMB; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c779SqMB"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so251349a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789514451; x=1790119251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGMnqDW895Je/mS7NKJPFeoFTm2jsczP2vXK225eeOg=;
        b=c779SqMB+VDFeJaqsIMUXpfCUjIfCs5ibJGG5UmntZMG57yjx2WfQpubgheR6/EBA5
         uxw7Owpxs6WfHqJUDhVYT6u91kZA02eduuTmhKP99a5RZ/8+zKmarpNP9J/g1gNIemPP
         CdRUnZQQ03RzGBXhGVaR+WliFBMBS9/+BMWX4955WYVVI6cbyTW6vqXaF0ge9yNQc+4w
         n38/bCnc1RXiS9CMxd5nwy2AcPatUSjppZvCnQ9+Z1EKROQg6zdytBdWuuTStcXrI8i9
         Zp0+IgDrZcyUPF7H8HA9TWsqVETgNEPgdiJBrly1il7R9RZBXxBTQTSBy5zdLtMsA/q6
         4H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514451; x=1790119251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGMnqDW895Je/mS7NKJPFeoFTm2jsczP2vXK225eeOg=;
        b=MW+Fi/QZ4Uj69z2KhgP4xVGTNJOkI1hC2oQCI/uwHfadI0WI0oHUMng3In/FyFP0e9
         gOymjS9Fbvoy6enxRazTxYgh19X03SyRbSUQWJITLS2E7gKjNU0HAleXOJV0iF+aEDgj
         v6AiEthPiug24AQGGCDlBYwkgj2fG3zq6JdoFMndhFPFBYroScaakfzI4BNv7A5gPvEn
         2B1XqNiEdpwmyNXvKbiYZxwGnkxbZLi/0s2RBD20a3rdBKC47aB4kxp6opcpiqKRiCDj
         xeRPfIPo65WOdFZGjKDMZ6XubESmSyayfg+J4+iWoUk3O40ADyDXPBlSdpb4PKbzcNeD
         uC9g==
X-Forwarded-Encrypted: i=1; AKwUvByXaTuxVKQ+Y+GcrP7cA6to1LKulPDhMFbDwVCnthYf7k5c+vs2dvZ4dP4i6d8hIMaPDTASQVp4IDL+6W4=@vger.kernel.org
X-Gm-Message-State: AFuF++mkvZk96E0R6HHnD7lsShZhVk6OlKU7bGeSQ4bWl+jDBbWnbXij
	LUPrgHbg3GFv8/g2xfczYDM5OtwBeeOiY8x33uATUd4GdxIzaOdUAyU=
X-Gm-Gg: AYBFou1mFWEbuVjv1xHMyFBROTsAj7XIvy7jWVaZ6u86IDz9pQiO+Xv8hvgnh1nT1xY
	JoqzHa3MdHw2K31SO+DqrXJx2JFRBqKM/Fn+i1aFQ+U7Icqq/wSA5EEujnT196OdaB1KcsHRw8e
	RVnQLiNDWL8MbMPcEoLmZ9yFt1whIRfY/nYlrh9dlqgCfsCkaS6XNHe9XqZhZMYeCtcUyWVf2B9
	85+R6XFtANh0dssMJnSbtV2SL370VDbXBLuEsK39eBQzbdrQf58OwMacV/2nPW8dHu/RGEWqSpF
	mOsisALwiODQUpACZT94btiYOQ/M6LghXE3HS63a1k0hU15fhCwTItjTfKlmHdj2Ov3I5zsd5Rr
	Sc1FR6R+1ZwsJzJSPBAk2TGRM+2WGI7ika315+YB6bT56QoEKrnMkJFpa9JMH6ARvD40tIx3RN3
	p6iUqmnwXvvJDPdOMrlx6Bo4CIgXU9IJQYYuOshMnf4hYi1ZX93QoqzsLZUhlLSIXL0wJsAviNp
	iJoO05BHOhQe0uiPD3s4JJVPmfkmg==
X-Received: by 2002:a05:6a21:9090:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3dd5f5d8672mr1159394637.17.1789514451428;
        Tue, 15 Sep 2026 16:20:51 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.59.94.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a166sm2341985eec.10.2026.09.15.16.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:50 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: 062bel313@gmail.com,
	Alexander.Deucher@amd.com,
	Christian.Koenig@amd.com,
	Kenneth.Feng@amd.com,
	airlied@gmail.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	dri-devel@lists.freedesktop.org,
	ed@aicharmers.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch
Subject: Re: [PATCH v2] drm/amd/pm: defer UCLK DPM enablement on Apple Navi 14
Date: Tue, 15 Sep 2026 19:20:43 -0400
Message-ID: <20260915232043.1222-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_NyBdPbavmiPVdsHkP_Oi1w7ngX0kPSNce+BWN-YkuAFQ@mail.gmail.com>
References: <CADnq5_NyBdPbavmiPVdsHkP_Oi1w7ngX0kPSNce+BWN-YkuAFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I can drop the patch if you feel strongly, although it is pretty
> similar your original patch, it just keeps all of the logic within
> navi10_ppt.c which is cleaner in my opinion rather than pulling navi1x
> specific logic into the core pm code.
> 
> Alex

I dont have problem with the code, the problem is that, this is not the
solution to this problem, as i said in the previous, the solution lies
in the DC not the SMU (i tested by removing dce_v10_0_early_init and adding
that function to dce_v10_sw_init), it is also confirmed via the testing using
Opencore Lecacy patcher, which makes the display 5K, and make the display not
use compatibility mode (4K), and it also fixes the SMU problem.

(https://gitlab.freedesktop.org/drm/amd/-/work_items/4455)

You can choose to upstream this, i dont necessarily have a problem with this
patch as long as i am the patch author (eg using From: )

Thanks
