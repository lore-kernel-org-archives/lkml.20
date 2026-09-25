Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0594C226C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353716; cv=none; b=Pt0MAZMMJpYp2CgKsUqOFxhIiNiPvnKN1kkuiNenj5k+FAAAoF2dPu0fBljQrHGI8ZhHEvY1FN3MXyyoIiHS3FtjijIhuxcjcRoOrwe8chIbLW6d+2MpNMEWEn/wnwAfXKkACKbY5Df1EsOLpyW4dIa7RQ53a+4+W1JmNEi3fxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353716; c=relaxed/simple;
	bh=l+2wzoIOJ5TacTdwjQJG0rDHJINOx2GRB1xkArKzQmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gmh6xHvyGMMOqJyV83GDkCf+KogB5wezI9WU7sFfFDGZkXsP2y7kXHnKtpDPnk8vaUF6RNJWXXg3OFCbe1zHvbAdobOuqwHxk04IBNDEE1uBuxVqUEmFpKEx+Y8I8AF76uqtNWj9mJVSTevYGJuTOozkHcw6aBeLe5MpKrbtkls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmglRRCt; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmglRRCt"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so856482a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353713; x=1790958513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GwpFfXPotsrRNWGW8QfW7lFLTfBJDFVvrgvILRfxIY0=;
        b=NmglRRCtysELuQ+WhQ0EK8Zcvj6wIkxsZ7XLPhTxeY/C5+gnw9eds089MTLvdhZSFu
         iS1VSS37awT5pOsLretvGGyqAkcol8c1hsA3HufkGDLF3MXl+9PjXbNfl9t8859LOEgB
         sh5SEZ2a6gn5YQewnKhx86J8PsIywk5Je6do4HVJ+XLdEE7JASGdq6uW7L4CxikW5mWZ
         ufE40xJKc7ybYh7ka5gGXuo2WCqXkbxkEvjQ9NYLDkrYfAo/xOjRfKkzu23rPt+VgyR9
         ixnuy0iQsZ8xwQi5KJUROV+hK32yg891V8swgVFkUPUb+TCng9a6feaMsJ2qAObtNHRn
         JEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353713; x=1790958513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwpFfXPotsrRNWGW8QfW7lFLTfBJDFVvrgvILRfxIY0=;
        b=IQ3TVu8C9Gm+FGbwZsggDnW+4Gu2WBRJwXBOVoRd55k2HN0xeTJMowr1mKaFiHDzyi
         j0DYra/yBQ+/x/RnWAAKBpyq4jvubCrwdo+lvzcecxmwT/P6dBb1jFJNMsyNZsatL+Oi
         MX8rZoQmMHordTbdoWvg7TWtlwCRT8azwKVKmsyB+IqFob3bLULUx+2+IhNsmrzORWjQ
         1Xw0Zu4BLpEO1HJqI6SIqA9Tnf1ktbvzX1i9GdCW55dPm0yN8qFkAHQLIm7oIbR5TJCf
         MK3B79X7bKYPHhRncJuRtKs8T8LXXlk+9sHIuRfS9NSlDz5B9aGd+jBGlEw+8hBpEShF
         Tipg==
X-Forwarded-Encrypted: i=1; AKwUvBzdSUuygvJ8nloZlVVrd9aGVETVldNu+8BK5m2wLockbdpa01fWiPybXmLvko81bIh5QbwTsLXSV6C9org=@vger.kernel.org
X-Gm-Message-State: AFuF++mgZ1ZGjSy3Uhuj6JltXbAiquv+89/2mCfptwYl5zCniIjZbILD
	W3xJYvbClfZT0KcnMImU0cPP/H94rSafRkmdHn0P+CcctYTYgwtje0dp
X-Gm-Gg: AYBFou2sTASKuNob0YksQGrVdWpzLK7VpLJ+afz26p5IloHLewAjBCYCp4Q6wpQt7z7
	bGQSBWYKJ6cw3gTSYI1lfVBbGTMJEzSme/+mYb3BuBfLZml+zmaMFeuPLdzG4dJuAEfbGlbF0JZ
	h5MNpYaIgvJhB3kqNCqzDV0iyCxSkawAAbjbMqlX0ldAfLZf9k5TWHGIw29hFr7nrFDSi80XwtC
	gUxZaXJ1ZD45X987tWlKmVZ+h6mUvU81/35kCz9c6BTxeVHRkE3El7VgeMxdTM2ufAO9z4ucBSO
	UhRiQMa5uTE9kmAg3KNjaCu04EaOYE9gVMwIDn7aoLKyMvRBP4zl1P43yOLfOKYnVb/yXP1A+fH
	ATiyZStJrvwt9i7wBaE11p8AFmQO8uF7ZKZDzYq1IPWIf3lss08N0EDPYgFQrWrbwjkdxumPKc0
	2xnkVNtGb532+zFdQmXYzbwCR26TsBhKmMCLFLSxpBj7zZX6ZubVE461PxAxmE8g30vpMsNFMzs
	lDSGovfNAFeCQ==
X-Received: by 2002:a17:90b:1350:b0:39e:6c6a:656d with SMTP id 98e67ed59e1d1-3a0bb630128mr2176047a91.48.1790353713455;
        Fri, 25 Sep 2026 09:28:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm12169939a91.11.2026.09.25.09.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:28:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 09:28:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Message-ID: <2301d0ca-9cfa-40e9-8250-4438d30a0059@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:36PM +0800, Colin Huang wrote:
> Add support for the Renesas RAA229639 and RAA229640 PMBus
> voltage regulator devices.
> 
> Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> driver variant, so no functional changes are required beyond
> adding the corresponding device IDs and OF match entries.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Applied.

Thanks,
Guenter
