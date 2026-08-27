Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9BA46AEE4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854776; cv=none; b=MJVxgD6zWorodNX4yN5JtQxlAtzvSiqBhGCi+/uxb/gcpF1CfdBiTW4aEsQgxd385TV5iPkmKYDX/s8y6rSdAhmFasZDDwO/8nUGAw2XWHl1KfOQ/tl6KMUQS71h9S0LEh2bgHUPp6awOXL8wCDA8oVt1lD+S7ksh6I+MSDacuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854776; c=relaxed/simple;
	bh=b00El0lY+1vglMoXPEaunV+c5xkWsWC2fZx+ObgptIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0IQDn700T+cauu6E+WB6snlR1hHveivZ/rozAmI6xB60OmIpf0rdYJ7ISrq7p/16Og8Jl6wlhKkv6FdaSyuxL+EGDfOkgg1Ys5gcF8dMYyaWKjuEIvpssenb5j4tm1BHgeU/Hkj5xx5879nGwPEo6FqzQIcY275MIrNAbJKMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQZ+nTe7; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQZ+nTe7"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so58763f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854766; x=1788459566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0N7A4g9Z6siCzGcIeQCrf9aJnqqFTqpG+UHLQb2Qlo=;
        b=KQZ+nTe7VVHpraq5U4Ajuk8jONMqyC/1Nc6BXYEY/UoWyqZuC0c+Ur2iO/S7uaQ+ws
         +MzmtGk1OfgaYtFv36TiQiQtiyuVpcqtoWfKdaxFVEzMvFazOik4DKpkmibnmNlXT8iN
         DfMUOt8UtZxj+FNQgJUTkSb6r+CMCKQYhFbTb3DZQDpfXhfmMtDbZc7tjxMu37XNOc/P
         8LuA4cORat24/HyBbR7LNufYHSGDa/HM20QSkydxBuVjdoeuYs63gJVdDrsk/pIbDpfZ
         5Ol4w7VIkVy6hAXo37z9J/LwkPUXZX1UIaAHY8GGW78wG/PcftUYgFQEqcVWi2SoLTvA
         /MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854766; x=1788459566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K0N7A4g9Z6siCzGcIeQCrf9aJnqqFTqpG+UHLQb2Qlo=;
        b=s7Pp8ZclU+R2F3xle8rZMeOY42qttpGBaDXLWYEEa8yNL6HLzs0ib2/4N7d7fNugQr
         mQRp1QhRP7x6TIkgbxzx034flD+u+SOunerSWK9xipUk8hOXaLhwxpiOFRbmuON63o9S
         T8Aj/38KnONqvRIGKY+Lxtun0h5Q1Dr4BY/qE7uZkh0PFGyo5dkTYqnEzvvsi6P6yKLd
         Nn+udFHKWuyJrtgBWmrtTlWmL7Zwxi410NhqjUIBJgq24jvwt2xPpIKnCwKBYyU4V6vY
         WxKhkYlrdRiN8sAGL2HlYtaxGKqmYdq2ZedTpgnfbvGJlaIeCos2+38vyP97oEhldYcU
         c1vg==
X-Forwarded-Encrypted: i=1; AHgh+RoFtKJ2FYPng+hs0B4JOqEm8Az8YOQVEnDM7ciHRDB943PZtExLQk+yBIq3DpDJ8FYH6AEA4jS+K8S2X0o=@vger.kernel.org
X-Gm-Message-State: AFuF++npj3tNt+mnDdCC3X/zGTmeb3oHnkbCz+6n4RC++619uELyFrDM
	YRchXpjrnKHAMRw7iVidUNHET1L3Ch34m8Wo1jy/guvu9vBj2gGJQ4eE
X-Gm-Gg: AR+sD10J7ooaRK0MXVF44uvlSLlE/1UrwsAvnNYAR0eSTjOBlu1kcxAFKHCJeyUkaox
	TvsjZrWweNGG0ROfWKoDkm1s3Jr68aWxhzyXg3YgkEPq/l1i8zNmyhR1df4T22WLW2+MR/sgPQ+
	+Qf9um31FCUyUMCEATJrysCkARPNoeXx7802t0nuTdOmbXBhYGgpuQOkkEwLigrHgXSsBX+X1Pi
	kqY3K4LgaQF8A/9akDgUEpIM5N1w8V7lodf6hXHDXMAFIPkwLloqXxyxk3TYPhZtBhusk+D0Uhg
	vIDe8qGQq5A7lJgGqiWOoaxACHS2oj3fo40+F0fS11fTNQcdcVCJDwViEoRhoCgDNpkylQEBRhi
	lf5HpRc86QCzUTvQJLrAZRPT5MRFJJ/4MkFX3LscQK92rSUdZIEF/U6DQ6JauG0k3MLfA8uMy+8
	sPoxzTyDD0a1SVbGPnc6wbs8R5wFKSEZajmNyMpIuoZtbs3Z7T5m6+AXZJsYzjdiwbxKQn4hdeH
	Dw7x8OyvAFIMH2gJzshz4Mq20XqVQg9JvXOcgqyg9ok
X-Received: by 2002:a05:6000:4a1b:b0:482:e4bc:51a9 with SMTP id ffacd0b85a97d-482f75789a7mr1643068f8f.4.1787854766117;
        Thu, 27 Aug 2026 11:19:26 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab1f3sm11158603f8f.11.2026.08.27.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:25 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Bingbu Cao <bingbu.cao@amd.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 6/8] media: ov2740: add manual white balance controls
Date: Thu, 27 Aug 2026 20:19:22 +0200
Message-ID: <20260827181922.2432231-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <BN3PR12MB95696150D1DC736824104D2D8BAD2@BN3PR12MB9569.namprd12.prod.outlook.com>
References: <BN3PR12MB95696150D1DC736824104D2D8BAD2@BN3PR12MB9569.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes, the three controls need to be updated together. v2 clusters digital
gain, red balance and blue balance with:

    v4l2_ctrl_cluster(3, &ov2740->digital_gain);

The runtime-resume path also applies the clustered controls after the sensor
is powered and initialized.

Thank you.

Maurizio
