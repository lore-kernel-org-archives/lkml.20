Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E64A49AF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439277; cv=none; b=jXo/5v0V+/DEELJlxhvsT3HpPL2w2Ig/IkCEAnmvTEZMGQvmy+1gTACbt9knDqR1qHYW78ugbaVgZ7+3ZyUHSsd+7S2O7SrR89PS/tQeo1LGFRCuTXqIYG5dtubWEo4o7mkWBTeVdLqwenNWJGWOUyaJoJpp+HbPFnFjtgcwKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439277; c=relaxed/simple;
	bh=319TtROIp4k6HKXuhKK4mVyHm/0kJT6EedfSsyEPGV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mG5tRScMlJn9BEFoIWPnO1CRn6zsFYfkfwb6rqbMg0TRn74jiRk8nD/TFhleLM8//7SBSNHhpOoEcV1dOnugUh0vUou1T6YiJ60F6w3ctOaxBbmX7egYKXJxqeL9nrj97OdInWfeY8064uwDua4TFs4ivnPRQoR98PciNLYcjIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU1kZwme; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU1kZwme"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20ce3c118aso206373766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788439274; x=1789044074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OdGwx32ezn89YbAvB2ilQpl2ZjEbuFoBay+4NhbUp8=;
        b=GU1kZwmekYelpiE2l+fMjgus6IqEozaY7PnLFcmXNkDfrubS/gi1SKJjOOKrjfw7RG
         52XFWD6BT7Dr5UQ76Z78SkLGJn6lJROC31ulnqyiCJrWCNqkir7Q/wDRYiqVO9xZa0UR
         GvEWEEbAGfumrZB6PLFsz2xgxOuPnFTo32M0j76pcKO72uGPbzzUDmj41lF09nbpLuQM
         6wO5df64+EaSLQl5LMs77Czz8tpz9vN49LB9RV1OqcIeQ23gGpC/gRMLbHoF4794QnlH
         ypFtEDmjY7v1+Kc23QF6Qzkvy0eRMHg59tNGQZyLd7vk9oDT5e3O/Iw2lHKdEIwlEMOn
         z0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439274; x=1789044074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/OdGwx32ezn89YbAvB2ilQpl2ZjEbuFoBay+4NhbUp8=;
        b=bbCnyLHCwNGOpDOFgoFQ2LTPa3tm7dsEtgGQ+4GoKqu3H58Cm/c6LWMEbXA/h0+xr4
         7P8EBe0FDpeCuMKkmiw48sTL1ckYeoGrqg+jzhlHhOM0pjfMo4+7VaJRiyRFJFfbEsLx
         MLmIfVFeiUVfl7RN63tgOtO5JWslSQtYR93eZJj48+LwhMDin27eks5LM3D5Z/Kkv2DH
         pPWHvFlPcZtCZkXEs6KC0VJ6/UUwqGa3BiLnmDo0SQKdtlGCG+DcMKlnvWbdznVhFf+K
         tesUbicTaDRXMF0MvPCrVxUUUhzZEfcj68dJ6yLTmiMKW7/1MjV0YfIcriYvyMxE70kV
         lN3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfB9HZ3vGdmWMpX7fjks+p0Z+FZ0jXDHTusjZD6QXTQ1WuQsj8d/nwxfy/7yEehof9ujTPXNDEcM2rois=@vger.kernel.org
X-Gm-Message-State: AFuF++mVZpsm7+px7Ve6LtiN0coox0kSrVWxyQbRUu/XvgjSMWEtsM2b
	CVsj38v+BT6o2C2uvQXM/rvzSZmmIRB7grV2cV5oN5T4Crv+OCNJ4Qn8
X-Gm-Gg: AYBFou3oIgHbCd0lgks8qPFrp+iZAFS8yF2YnlOyzPPY2AwYGjyn1bKxa0I10oHBMqc
	Y2FCxgrGXxGH9NkSspkKEhFLYacTP58xPLfd+Sa13wDQHgcaDSub3HR2SfuNBiMB2OpzxPp3Pny
	tU7DvubDkoFa2GwNMTmlaVOmgqjYdjGQ7+G75lbyZQtqZsrZ+j86/gA3yxfa8xMtbLGGzE++TcI
	aXXsOm63DgT8I61lT3lN1hVLyEn1kj568gw4ZiQhC72IDMt2Teaa6ZzQ+0bXm0SDf0FEv0+OJ8/
	ZnrPTqcLk0CrWAWS15AVPqD5vHCrZKBuud9ss9GJ4BE0vKLcSdV42gvRIE8V3LtfJJLLpD1V2ex
	cO4RXy8Rz4YPbZvbLfsCsZUPEFTDsGL7OupphlYrnH+lPBV4aOBf+G1Bj8KIVprL/gqxDNoI0ic
	s196UF8/yogBLzEB8B6m3Z3pi5cKlxxZsIZ7rbau9r1COv+HQq6fugpELrYTJUa6/eDOSmd26mx
	ZxFhDPlA0qbrpHcM+CVHpcn+B0kfAvT0WypDQMenTtdCy5vojPxjDnY36pG
X-Received: by 2002:a17:907:970f:b0:c25:32b0:e56d with SMTP id a640c23a62f3a-c25efe0425emr292477266b.7.1788439274267;
        Thu, 03 Sep 2026 05:41:14 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3a396b1sm93223066b.0.2026.09.03.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:41:13 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Yohei Kojima <yk@y-koj.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: warn if file creation failed due to uninitialized debugfs
Date: Thu,  3 Sep 2026 17:41:11 +0500
Message-ID: <20260903124111.87353-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ai0m0atzc0cXT0yQ@desktop.y-koj.net>
References: <ai0m0atzc0cXT0yQ@desktop.y-koj.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jun 13, 2026 at 06:45:53PM +0900, Yohei Kojima wrote:
> > While I understand your frustration when adding new code to the kernel
> > that would trigger this, does it actually fail on a normal boot today?
>
> No. As far as I tested, no existing code faied there.

It does, with CONFIG_REF_TRACKER=y and CONFIG_DEBUG_FS=y.  Since this
commit every boot here prints:

  debugfs: Unable to create file 'net_refcnt@(____ptrval____)',
    debugfs is not initialized yet
  debugfs: Unable to create file 'net_notrefcnt@(____ptrval____)',
    debugfs is not initialized yet

This is not a race.  net_ns_init() is called directly from start_kernel(),
before any initcall runs, and debugfs_init() is a core_initcall, so
init_net's two ref_tracker directories always miss.  Nothing is actually
lost - net/core/net_namespace.c re-registers them from a late_initcall(),
and both files are present under /sys/kernel/debug/ref_tracker/ once the
system is up - but the error is printed before that happens.

I bisected it to this commit and sent a fix that keeps the warning for the
case you were after:

  https://lore.kernel.org/all/20260903115135.63210-1-mikhail.v.gavrilov@gmail.com/

-- 
Thanks,
Mikhail
