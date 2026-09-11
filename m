Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CFB380FE7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166118; cv=none; b=uVgZFapOZ9a1wBcQHoJs7nLaqi4lu+suyFMpGJtWjw69IIZU+OBh+LiZMqnaLYAOyUgAvh5g3ZTBUXIPS0sU+2Y6InUJC+HGZZddaxQQQbIMw1mM3NG8Y9hJxGsZ9WKN9DWho7A+VQWT37FmzHEpx9FOEiKGva1fzM5IB7VfPw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166118; c=relaxed/simple;
	bh=l8iSqcCERw4SllvOimrfy+/dr8qik3CrARKMXuFOge0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qi4/28eo1WqS8hRDVvt4JkF7f2u78j2JA5/SXamg5ckC01x4HP5R1C4rKyVs7mhRkjfUp5kWaphv3pqlAHDxJDzD0HILZVq3WW8FkLWiuNMFy3OezzjiE59sYOVDVboX7B/ASeeHeSiBdZXpysSsBV5K8Jc1LSVOmku0RZ1KCFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZCKyUzn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQ1xUEwB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZCKyUzn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQ1xUEwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789166109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
	b=fZCKyUznrdtnZkcK9P6YUbIHkkrpHdmBBWH+TI3tK/Z5a4Jjz3p712EVE8PU8oOciSzeOX
	8Pi7Aox2DBojxWyPH/EL/MztvzVKnJBQmWYLg9F23FwcnJ0hFenaTjehazLrVTwrs2sG5q
	4AwZ+IAoMgmh3EBkxKe4/rjhMS+42jI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-r8YTD4PQNKWz-rcwv9uMjA-1; Fri, 11 Sep 2026 18:35:08 -0400
X-MC-Unique: r8YTD4PQNKWz-rcwv9uMjA-1
X-Mimecast-MFC-AGG-ID: r8YTD4PQNKWz-rcwv9uMjA_1789166099
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so26738031cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789166099; x=1789770899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
        b=jQ1xUEwBE/rdnEMO3qsog6OtmCWgYmT40komp9kSdxmz5T5grHYnr3GyHc151+E+ch
         8PTDCtf5h8UAFKXvhdjgZMhNJbLJhADB29GOITbZ/rdlG5t+GcrHn982jB04LUJMsTLj
         MTCZwtNuN5y8Nh/4IR66Ui3ogmcilfvgMB+Vrx2gliNCnmIKT0aiRWjy/086uoRsrHkW
         P8gWqfhdwTGY1ko6vPU/Mv7KmWv770zDDTdrRPaI332JLSBXfGIYnqt/qzxBc3Z6vOgb
         WOz9rM+Gx3NcMpwcZdF1kwn0y4+IVj0Y3i06n2p6n+FYXgm7uNT7THFe72RZ2NE/RmUS
         dosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166099; x=1789770899;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
        b=AT3y6UDYvekETLLy2VrJS+BRnVEm+4YJMBwE+ukejxSYhhIvW6aWseOSPw9+bHp/H/
         XPGhdP35xpzAWPUb7/tIpR1A1WQzJVT1m9cvTbEriH5F9tyDYD9wjyCMFS92pY3jGLV9
         NIE/+FGcFM+tgj/ufuNnnEKTeKhlmZS10iOdtywU4pIOAjQYh6xcLTJpkJ8Qq8iEZ4cr
         Dc7JJWCgsEyrom3TQ//RXJUZcaIXGlhJf0K0ZSb1NMLgz2aRhRn6Mv1dwuO/jOSBRj83
         PcxogDQm8gtX8rr0V/kVjzgh5uLJcDQvDp0kbGSuappjBaMiJiFmhrdZq+CTDdye/n+S
         Z4KA==
X-Forwarded-Encrypted: i=1; AKwUvBwhSAQxQLOMoa5Jpmly67kcibzraWi4bAqZCKMUaP4bl+lutNGWPIP2Az5pjn4+j7oxy/PBU0qpRKeZ+6k=@vger.kernel.org
X-Gm-Message-State: AFuF++mVEd2XUAe74ZklvU1PRGGKQLByK4bltk5OMz+rrpeIw4T69kgQ
	2MZHyRu2eR29nqJ+O/UdU/UJ5xfoC7rAR1AEkwHDJ2y8u8EXQVg2Cuo6GyJ8qYKnvuXlNunJ6GL
	/g5sxnrpyUcLfiv8tcDenKMHO6fxJUk++y+FDT3P8/mkDfaRI+ymtzQY57hXZJGd2DA==
X-Gm-Gg: AYBFou1ZXke63W5kyOhnO+YxYRNoLAyUMF2UVDSEhB5bcV25yu9f1pLeHg/Bs+NkGhj
	ZNtRxr8Z8rq0oLYMyGlvXeQXHYkfUY48QMw4k0GU2RWP1uhpNpaS2ZuLBABecsuy40Rnidnrj/l
	rMqxtsesuVS6ioyAvAe5Y9K7Yt7ADhAGDR2CjzCUi2UkGvSb9qlj80uWk/nZr/gRxaoYqeFk3JV
	T17LMJ45dvyqx3egpn3Nvx+YO7Zk4XgmUdqi3XK/wck71hJ75QVr0F2S5TeV9418zDcNTasBLAn
	iMwJhJSoDk4I2++hmpH40ZuqP7DhaIiEtHViez0QSBcaL85SqgXCdI7aASRNZgfKXkw/EPBqr1f
	Lh8c2bxrVf77x/8AWtwGgc+qY624UHL+QWq4v//Z+
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925751cf.8.1789166098950;
        Fri, 11 Sep 2026 15:34:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925361cf.8.1789166098564;
        Fri, 11 Sep 2026 15:34:58 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530cc781402sm28631931cf.7.2026.09.11.15.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:34:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
References: <20260910033000.15926-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration
 kernel-doc
Message-Id: <178916608638.746679.11554691931309415049.b4-ty@b4>
Date: Fri, 11 Sep 2026 18:34:46 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=F5o1tXYctjSgBI/LtZLOoWzWpvKzHWB6U29+4E8/BK8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWNHGz1Rv9ef7R/H6WvYPKyV69j11R4Wk/pTJCPIN5v
 ML2ynt0lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJGyaYwM99cy8j566Wpfs/h3
 CNuZP0GXPdlV1c57rtc46s+d94IpnuF/Crv6VYVM/yli7qwb+PrEI+6n7TIX2/1T7fjfJYw6p2Z
 zAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 10 Sep 2026 05:30:00 +0200, Karl Mehltretter wrote:
> clk: mediatek: reset: Fix device registration kernel-doc

Applied, thanks!

[1/1] clk: mediatek: reset: Fix device registration kernel-doc
      commit: 8d5fa37307ac1f0612cf17ac0ccabcc258cc1526

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

