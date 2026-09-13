Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3E3F1ADA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310504; cv=none; b=MKb5iDlPp5YHcptA0oQbeCwLp2UGCRWlM1kqpRbDyiPBpzrVACRJ4YJH24IOg0ltTRsoanLclTNT+OE06Xkisb4Kavc61JDwnwYMcYKk2i+8X6hK9V7zaRxBJgcDJ0nDZZn17yltQsKx0fZEJWTlMNEeeGiNCBzx47Ktm8mmnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310504; c=relaxed/simple;
	bh=D7Ff3lh65lV03e7Igj6UyxY3UQtZS3FSzOTzHrYdvAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKUhmqfmQYASiQdF0gfo+9h1JHF9BJqGrSNwsKAiiW+cTkwrIz0mkA6uPcVKw1Pl01xrBcy67DllaMMk0gWB11FtaEkpCQYQMxd3qlWtH9oH3jHhV7j56WRyrxKDo39xGgaZ1EERVRTUPo5fp0K4UDXLsrd1+KINCbclx0Hb6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPcNqtBW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPcNqtBW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so5085535e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310501; x=1789915301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIV0NAC3V43neVsR53ty/YkUZ7OARFktw9BGDvdOJWg=;
        b=NPcNqtBWStO1yzfPF+Ib/cIzgHEqsu/hrvs3klEu3uTMUIhO1CgJv2UXThy2rQjIf9
         YNTglnXA/4vEhjbEPXzSqDeJmbeqG8xMec327l2Q2wYwk9PWSsAfksJQet/G4++oS7zK
         TbBOGTsxijeWHC/9styKPRfkrLXh7jj7axhxn/e4MtzNFjGidUT0QwJcgPCUSvDPsi0O
         69cL4F+zRAO8DGc3fd6rwSODPZhp2hYhLJGEcxG5JeZ76VjGTprhIb+bQCD7PE3VSfIP
         eJ241gvyu98R4ThE/YFqVV6mdRWnqF/+XOwSXQ1BBiCu1mlGM0xPI8KjtLvxv8dWUoOD
         GDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310501; x=1789915301;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIV0NAC3V43neVsR53ty/YkUZ7OARFktw9BGDvdOJWg=;
        b=UYZGkY9otKNBi+ot8S+97/+aBpOGyJB6Ijxjr+hmqAcsa/eTLr1H/+M/RGS3LGGMMf
         HuCvGauWlRClwJgwiN3tOhWgLKgTlVqpFcEOG7IWqgfqahvtP6qIcoxDNuFQ6PCCpFOz
         PtunNZJrAe8LGnCnUN5c/dG6BuNdwOzzHM1xaYpFSefR8zBGCP/3SCBZwvDQOVO0XYr0
         RAqW/y/soJkbtAk8/D/DcxoPFL8u1jqxafdD+36YsqkBW2NHgPCVt12zgsb4eF/J6XWd
         Dj6kthS+QjNzNthFQs0l7W97/MaPESUYoz8XD8tORQuVtsxi8hj/8M0You8IbWdIYukH
         7XxA==
X-Forwarded-Encrypted: i=1; AKwUvByMWRITSRl5f0OFg7aUyCp0s3aDiRfBLvXRWC5CYbS2QDnwv0MCXhgHuXaP5OF8obftp+q0JM8P9QdVK8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lOy211iHvHmfJidyfLDO2wHGRdhymMNar63NdRQcnzwbCY8b3T
	AOq1Dy2pr5EKwYkZwDPzhZRNjwLvj/GBSfg+40/jxdiBunCghRBQrK0t
X-Gm-Gg: AYBFou2hyL6G91DeEqrIfnFTffbXbTu386htRIUOiTt1gU+AriqDcNZprJZEpdgNmNI
	tEnKAU5L8nojWEkfJbKNCQ5Vahu3qIJ6jHhab2wvl8kl9LJU0Pktc73IQmc5Ctt31VTVGE7cjse
	4jprpVe3xcWyoAAnztFD+FnINwCSW1zI9zO1RVw+TmructUMMczviqxbYe561urxmrhnsEt+0Pb
	noPTd0VdoyOZfXuc3dHzyB6sru40M1thQgizq4H8tbqs4TTjf+4uAwAIPEcx6hygH7tkcIKkNTd
	ApK1SdaJ88+sgxFuTfn2WCX2mo1LP4mL1UqmDq2Beusk6rcbO1LIixtaVCeOgnUjxTpWoGu1Be/
	VB24ijJmWvUPmK20Zr+kPXYriDSWen0elcp4OiToCv6PzFhNopKMcJgyR2xRt2L3K4C+2RKvA/0
	B8xzXI+lffmyUsElNw2cXTW4Bh2Hb4K+HTGkU45EqNgMXKyO9eixNcrQFKz2vVa8mAtuylyOQfj
	3WOnJBSl/fM40gI/QZ9CItqcqSjYsDl5upQwp+f0WrfN1au9yXU1xI=
X-Received: by 2002:a05:600c:4692:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49e619ad0e1mr258658675e9.11.1789310500681;
        Sun, 13 Sep 2026 07:41:40 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm343158785e9.5.2026.09.13.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:40 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dan.scally@ideasonboard.com,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH] media: ipu-bridge: add the OV13858 rear sensor
Date: Sun, 13 Sep 2026 16:41:19 +0200
Message-ID: <20260913144127.17995-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913100932.92087-1-lsa.uz@pm.me>
References: <20260913100932.92087-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch does not work alone, it needs other patches related to the camera such as
 https://lore.kernel.org/linux-media/20260831130312.26296-1-lsa.uz@pm.me/
 https://lore.kernel.org/linux-media/20260831180746.68878-1-lsa.uz@pm.me/
 https://lore.kernel.org/linux-media/20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm/
 
The test enviroment was on an affected device (Surface Pro 11) in various common apps such as Gnome Snapshot, qcam and Firefox (web cam test and google meet), all tree apps displayed the camera with the correct colors and resolution, the only error i found was that the camera was rotated 180º, making the image captured be upside down (I may have forgotten to apply another patch and the patch of this email is not realted to this topic).

I have tested the patch v1, not v2, the lines are identical so this shoudnt influence the efectiveness of the patch

   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
