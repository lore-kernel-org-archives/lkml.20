Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94C64D37D1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829920; cv=none; b=O2Z46VRn5TbqAbpYnUPWYaCCx1+gUUKJlOWba4/lOUwf4axOuQVCse3kI+XA5+L8dCioC71f8cnH3mOw+jpmgHBgEIfWlQE+A7VrkEIlQVhH/vii0ZHtKUMDu620ZbYz8hSN1p7adZxEuSiD7CasutxYu8xCYmBpmeKGWoO6Cj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829920; c=relaxed/simple;
	bh=k9HtPMK4WmShh9hH2m6JsRRZjIhJbSVtYZbsq3mNdfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haT+WH//xRooQNWo7jq8HK4S1UHEARSyMKIxnBjpf3tHbNia4o4Q5eQTpH3Uhw0KH1yoDjb0WrrdW88Du2xlzAMj6nQLYzebDHYWId7yF5r987QwVavtBWd19OpAf3IsA08dt/7vTDk7tYp2Pt0nlZiAUiIKFd7BKbL2MAVThtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGfFT/7E; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGfFT/7E"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso487488eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829919; x=1792434719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vuxsYH17qqFJ+udnCi2xzzMEsHX7wYHv3CZAY6j8oU=;
        b=aGfFT/7EDp2T5OB4/ZMQjdeK+079vFH8Q/DikBEUZEJuS/hPpViChEqBsnppb80MDJ
         b552ZNtNjERFNqvy5+8KynfRBDhXFjYxajfaC4Ylx6y1++QZkM11wRQ1zalVQP+uS/Xx
         XH9+K2Gw8XyCYjYCkSj2UmpG3r6X7ZGs1ixOzOS5uU3pTxGyOI5pmvRSr24/uZWnG/jW
         nAipnRXVvAWsXrxbIFc4wuEFVJ8T56IpikJNcZeLXlMAF/0+xZ+V2OMcNrKN5/fu2pcQ
         aVC2dyhppFiKsLjde4rOsqOP6gTSsp7mNcP34avUnJNaNn9VlwpIpBZl41bXW2UTL/7U
         uPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829919; x=1792434719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4vuxsYH17qqFJ+udnCi2xzzMEsHX7wYHv3CZAY6j8oU=;
        b=coNE1kuhoFhtzG1cp5z/tywdq8OgZb8/VHfkDTFTLhqJ1F1O0P1yE/NsCj816drPXh
         9MSETBN+EaqFGDARGQ7V1oIcTpIrxSx0U3MG6nzqpwVN5gcTkZEnX8OywEot4fbVXQF4
         MMi+Mufuh97s/jd1gl+WcuzwNHpQGVpBn6nYMuWVnAbSNvvtglrjKaq3ZRGh+ik1k0p8
         3yvKE5kSW1prxeXO8FiQrDifG0P04aYo4F58Ub6QORwBKIJtVBkcU5aEiOxEvXZDySBT
         L8ce5kwOdhG3RisFR4xxHdEAIkkhucESnnwXBcPheYpEk29/WJuaTHweLHqthMrIiQj5
         0QLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd6hc7uocZA9uzFC5MwQOrhplGsl99FM4D7e1439EXU5cRo637OdEPxtEtoCPUS/43PnhNPLOy6m3Q9JM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhWACUu4qRoRSo3NYg7xRn3FESMQWCh7mNZgBxY6b8f16oA279
	XiRloHBxQITBnvjx0qd8EgLqdc8T0CL48sbso0R0AKCqLXi2cOMoakY3
X-Gm-Gg: AYBFou3Zq2SvDHoXnqiHGLl/MoAIJkTRY7rXvVy7ItzE9E8ISwU2ifR7ss7SKosVJlO
	4Ymo5u4hw5JqvNKpU/QzFEnjoYzDYeObLK+SAMNZq1Lhj+5Jhkkd65YHzTkhyFVvqV91xZbLJ5j
	KxS0txrNHaLxZ7ioQvFf3IVO9jXhn9H+eRikdSAIwoXN2JAcwzodtP5gFe17+pkIOyDnGJdifnm
	BZFKR71mXsNMDYd0yRfJNa8r/8wA2JaO+ZbV//8cbxKRq8MDv+d0P7BH7ZXxoSkmN8tJdGWfYyQ
	7qVi47bdRc44du7kxEJX2RFuDIunPsUyt9CzwFQ8llUhIs1L3CBne6tZlfvHGGU48zY2JN/L+ze
	KuAOGmBU+D8EBl8kZQEFsD1HqjXgDWNvBixYHojmsuamj8obnHA9ZWL9TzF6WKC3KY6/mnpqYjx
	UXEkXF4zcmv72+DsTjk3LkK2DX4XQsNyV6IRH4CzGaHmEMNuodLHeQHl/IFugmAt66wLjN8+/LR
	9q1T4a+usjt++0=
X-Received: by 2002:a05:693c:8811:20b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-3567ddb2f02mr13073058eec.29.1791829918494;
        Mon, 12 Oct 2026 11:31:58 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:c154:b925:c82b:b0a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm37755039eec.21.2026.10.12.11.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:31:57 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:01:33 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Jeremy Clifton <gservice341@gmail.com>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <as0nhVbagZa8Birm@user>
References: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
 <CAC2RYzLMQSOi961mmyNkK1aVuMDafXdvRj_mCEAZQnU37sKA8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC2RYzLMQSOi961mmyNkK1aVuMDafXdvRj_mCEAZQnU37sKA8w@mail.gmail.com>

On Mon, Oct 12, 2026 at 11:57:26AM -0600, Jeremy Clifton wrote:
> For this patch I have only one immediate suggestion.
> 
> The firmware management case (case GREYBUS_PROTOCOL_FW_MANAGEMENT:)
> should match the other cases. Found around line 96.

Thanks for the review. I'll update the firmware management case to use %pe
for consistency and send a revised patch.

Thanks,
Pavan

> 
> You've changed the pointer variable to display and this seems correct.
> 
> For consistency, each should match.
> 
> On Mon, Oct 12, 2026 at 11:00 AM <pavankumaryalagada@gmail.com> wrote:
> >
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Use %pe to print error pointers directly and display their
> > error names.
> >
> > Keep the other PTR_ERR() call because its return value is
> > needed for ret.
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> >  drivers/staging/greybus/fw-core.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> > index 2016a74f137f..7053afa9ab3e 100644
> > --- a/drivers/staging/greybus/fw-core.c
> > +++ b/drivers/staging/greybus/fw-core.c
> > @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >                         connection = gb_connection_create(bundle, cport_id,
> >                                                           gb_fw_download_request_handler);
> >                         if (IS_ERR(connection)) {
> > -                               dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
> > -                                       PTR_ERR(connection));
> > +                               dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
> > +                                       connection);
> >                         } else {
> >                                 fw_core->download_connection = connection;
> >                         }
> > @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >                         connection = gb_connection_create(bundle, cport_id,
> >                                                           NULL);
> >                         if (IS_ERR(connection)) {
> > -                               dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
> > -                                       PTR_ERR(connection));
> > +                               dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
> > +                                       connection);
> >                         } else {
> >                                 fw_core->spi_connection = connection;
> >                         }
> > @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >                         connection = gb_connection_create(bundle, cport_id,
> >                                                           NULL);
> >                         if (IS_ERR(connection)) {
> > -                               dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
> > -                                       PTR_ERR(connection));
> > +                               dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
> > +                                       connection);
> >                         } else {
> >                                 fw_core->cap_connection = connection;
> >                         }
> > --
> > 2.43.0
> >
> >
