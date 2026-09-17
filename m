Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2FA4B7A41
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658413; cv=none; b=suNWvnFw/By8bVloC4sprUJk0pPqMbO8coG9th1+jlePywYg43cgNA3SfFjvgauxW+caZUKfv+ecbnKwCtmac0fD1v3mHa3f98dnPs8FlgYb9FzvNUojQH4fFnQMouwx+bt/N+QSW9C8lrxXvlOn1iWHMsyjJzGmVFsDM8ySheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658413; c=relaxed/simple;
	bh=Pr16IcWXUqBGT/dN8eDlUegItuWHeJylL28MXbSDECs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GaJrw2kyVWCZEH+eDX/Wtj6HL1U8egSn/ZtdC0+2hgs9GKPRCGwUw+dWYjvm7rJX98nWfCLp1pNNsZN6t9BKbyWhIqPNvqhh7s3WgplmasPD4z1IEqxs80OR78otXaH4/e2L/G16LJCdWaDLrlfgR7FoEJwdUqdhqPLnusgvvbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+MNZ6aL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HN/kWEtL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+MNZ6aL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HN/kWEtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789658401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
	b=W+MNZ6aLv1ziAepYMPkXQDY3+p/4DTdR1M45hNpUD8IP4g84J9Zh8ejYgyTb7QEjGgv6Mt
	faP8DInuTdmHYzmqZxYhytnuKPjCO34XvA8HjPxKYv2T94Qh/5RB+foOKdQZlvbnpSBJ1h
	V4WtQ+ubqx0VaA9he9YpvysMwaD7GWE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-rNSiMT_rOq2XzHjh2_Ebtg-1; Thu, 17 Sep 2026 11:19:59 -0400
X-MC-Unique: rNSiMT_rOq2XzHjh2_Ebtg-1
X-Mimecast-MFC-AGG-ID: rNSiMT_rOq2XzHjh2_Ebtg_1789658399
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91235881828so21647326d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789658398; x=1790263198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
        b=HN/kWEtLzfPc+mKHSJ0cr16N7LHxVVDX2B1griKK9lTZwzhGd3mOLFNTl9lrf4m61+
         ynjZnjvEFOtS5Zt44Uvz1UlU6d9K9kEmkhMAb2qfS9sVP4jEGnJCmiXRXoO/k7et8ds6
         /JRopAPK9UJnhLqxO4UFaOlfSxs+cQzMe+03yVkVn4IZvewaa8w6UsQRGnTPG2rMvexB
         WfQxcjMmis+0PiACXIJkTVydn/YhtaYo7AB6fYSkrJzA8f79VGA4tlPsbpV/ghCo83G2
         E2wlJ+ik0c+MdTNR25FBvQ2lhlEC8DaUwcJIkQxNA7Ws03xHOHVxl2hF55ipFNs/r8Ih
         h7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658399; x=1790263199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB+o9a7/ALUFm3hEwLKClWS3yWNFMi9GdQLNbpiNa3g=;
        b=ldemRdPs3uTBG8JV6l/TZDorDSVs3c18BpANMwHCcrPgWxF1C7D+DbgzacJZ2wdyyY
         DIiIe6sVFG1y9Pr8h7A1t6sMlsejF11JDyUZvJrrN65WyOQTaM1ZdWE7DUKxJ0fHHS8t
         QymKiSN6zWNV5jcDyg+NLQukSCUpLc82Ul/BsH+SnRlxu5ZQ0F5eI50M6ZMmyfGw4QSb
         z+5+H3L2fTAbUENRj6+chUhoJijaxT3ns9YZh+TEUdXq5/K9JizAuNGiP74h0jJ746Du
         xmvoAYTiBoMEuASt9sAzRd41KYR+4txloonXrLjEHMTSDsA9yWwia6KZHv8r0XUJFvUp
         872Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxKl1HAZyiQoQGaCYF7MSDUkugceZ9nkQcW8pNKowUjxWUsU559DN7YeIVwoKP7VdFzOdXjmIR9rrcudI=@vger.kernel.org
X-Gm-Message-State: AFuF++k+xbE8jCUn599mJAlB+OYrxvyvENyQ0vd8ryROuLwDRWHIGq8F
	eTvAnwKNSc7ILgIRFmaHU1cEc8w2kyulOtpeExEvzvdJir9v0RJ7h2HqjxZmrIh8i8anQ2aVewP
	gk1aPDp7vq7s9f8kEHbfruLVdtzd9xxtXvtDWBh64hxGcUPePNNzBCdb6STmpaHmKcQ==
X-Gm-Gg: AYBFou0sqZkOFj+mzDeGcvjAUCovKr0E6lhu5sh3MYMerg+wsA4hKcejgEjFqVITJOF
	WKe36j20JfdarRI2Wz532INZyd+YaeLmNtlEOWq2NTks0ScrKL7wnhILhr0BDMiYV9PM2XRSLOq
	/n6pHAjRHTWaioO4ahIA3qQe0PyloPNSzzCotKF9oVEdGqCvfzN6fzpFkm6oDHKFNGI/ikN7tFr
	KNe7BoRhwCJ4LzFGv46rgZFsUVmAMGIlGKgubkjNLowvglcYKk6IgOU2Sy7fWqqBDftClSnl6qa
	Z3YrjtqXprT6vrkI1ELUeM4+cH7KWkxmrkeDRTyICxBDWj4c6G/QTTLehuhHJITxhu8Bt8UN5MQ
	9a1bP4xW7swvw7nbEQYP+aoVecmUNSRBQltzcBG0=
X-Received: by 2002:a05:6214:4002:b0:912:518e:aac7 with SMTP id 6a1803df08f44-912518eaec4mr13974746d6.58.1789658398489;
        Thu, 17 Sep 2026 08:19:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4002:b0:912:518e:aac7 with SMTP id 6a1803df08f44-912518eaec4mr13974046d6.58.1789658398069;
        Thu, 17 Sep 2026 08:19:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252cc99a3sm112666d6.33.2026.09.17.08.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260912000527.231245-1-rosenp@gmail.com>
References: <20260912000527.231245-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] clk: actions: owl-pll: cast delay to unsigned long
 for udelay()
Message-Id: <178965838714.360090.14541070378650623903.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:19:47 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=329; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=GhNGxMokUfeR99zQB1+878eEK+CdEspBfCwGd+WWdEU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWsEodOb+q38dQ7ICrtnytw02ZbZM5hFwlOly9ZjB83
 bTAegZ/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOZYsbI8ODp/N58l+OBDnbP
 XvKbdj6466NvutF54qImySWL7T/l+zD84di17bXvo7nP/tQ7zY917J6/uNx/Spzc1eYjni/e/8l
 YywUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 11 Sep 2026 17:05:27 -0700, Rosen Penev wrote:
> clk: actions: owl-pll: cast delay to unsigned long for udelay()

Applied, thanks!

[1/1] clk: actions: owl-pll: cast delay to unsigned long for udelay()
      commit: 46c51c413242870a59f64d3c11df25d6693f6fb6

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

