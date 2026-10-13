Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910C051A138
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791927859; cv=none; b=l1qKH/zR1REaEJEqhWdWfB7bTlJMQ80pSvQJ99xTqkcaCXDiv2xLhoDRKN2Vm3lZJtFYI/HOttvIppvX8HTFOnUUKkSj71R2CN6g6cnSWJkQ9Z8QFM4eVZXLgUiAqAZMvNbQtqqLtBYJj1FRkvmx5F+eAv1sw95bLB3nA6/iq7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791927859; c=relaxed/simple;
	bh=VBIp6GxXms2kupMP5UWfIg3cv4VcQ6kzsVtKDA2e7kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrcNEczAJSCP4otjT7ATtGtei8eyNlsLopg6It3Ua1YIjFdTc0hKOxUEpSt45D9bCiNOdkMXUoeft6BdD5tqoDaR7eAKhR122+E/JV3ziRHnZ8mcb4a5Wj3A/rCUSld/h/7VKQvjCRlj8+sKwh0U2XFyKuZWz66PgFUNwQZKdEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM6K7C33; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM6K7C33"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-141395927feso6615179c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791927858; x=1792532658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOLHY7dL34AVKprVE1Dtl4uoSXssNyajFIK5m/t8QSw=;
        b=HM6K7C33kbrmvTppGNek0VjHuUc0JvjgVLaYU63Mr9tnZIUgt6nL+7Iw1T7M5DfQ//
         TlKbNnR2oF9YkNPMc/23kFX97TXNcLMerH50lYkFJJoJHtB07p7HAfNptx0bDSOyA5M5
         9vs1Uf4On8bLAh3n6QRjhJzpUg+BiD+yK+6KECjMwzS24Bf689r/sKtnlnfmYuQuOqcV
         uWxdvLk0e5jbiQzwzCwkyvJgrNK3M/Ytmf8ormN26lTQWRJIOXpk+Fv3Ttzv6liSM62D
         oPx/gNOEQjVQz7xk3s3IjE8IFhO6ZOIprxWiZD91LcdOvMBa622z2tjHhTOKdJt1arD+
         7f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791927858; x=1792532658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOLHY7dL34AVKprVE1Dtl4uoSXssNyajFIK5m/t8QSw=;
        b=E/Xd1sK2TvKpNvyBs3/H/IVdZEupIFtK0V5Cg1GNJv4Z34AsGZDmv51DdpgW8Z381w
         0V9xztTqYMeWUDGgHh11AK2C8av649LnQTYnkNfo9u06Bn8iQgKXJRlOUDvXayioRu4n
         U8JrKNPNkR7uRjZgKc5su0uxDTPtO4ttaiuEZ1xzvJC6/LePb91cp5+1L0nwhaZZqStc
         XoqPrczmGXy6oUkjQ9ESwQwSUQVBodAQw8UKGBZJgbiVvPmfZQhGckFdqK81w+LbHrgy
         EouhrxKJlNWimaiOU223jHHE6ZQBPFSKBsR6HbC+AjtD5PhMPT7p7dUrpa71yvDf9ov6
         sudg==
X-Forwarded-Encrypted: i=1; AKwUvByyRNlEp1XYYPOKloxKRvMWNBaxYt1mt/XLH6tQ4/iiZvHBvP1DCw0Ulhum98yLwNlDVZ/YfXAf1I/aq8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW4QhWxh/4/wuE280k7+M5AaHVMnLKnqiGDDsoVQa5S89mX44K
	VZnnAv96Xazzn4sCPOfvEwyFHhmUFIvf5x0fi7efWm3zFx9UJ6PDm+8G
X-Gm-Gg: AYBFou0k5y1crPw4Pv/ZV+L/k9BgZzz86XqXeGTqF0xf6ZGQLiMkVQyhnqF/w/wF+h4
	RLtGx01jWeSsYmTEQARtRPkdebl1omlE2cCh6Bg8cVfdepIQi07QjmAiMve3vtdxqxC0svMDFC5
	J06N/JYpIJeBYEA4HXCIcAZZsfDosVI+1bmI3cuTudPzKeeK8BFEhiJ2IEJwPypQbEUO0cAaNDL
	TburBdTQ0OKE/bLb8ib0uTzbuxGgcducCjJyykQ6DIzHvfIHLx0iK6bH7QrncloPaP09sR+Vcof
	f4opwuxL3d6xm1Ovi5u/sBbVi9dMcQBdu8sSMQZ0VwxVaO4jadCeWPWdXf77VqdhIhtqkt98m3X
	PfLpV1N/z0GonwqCqrkiDraCWXkASB+9GwK6F2F4VFAeQRibpCenb13ENvbioq6bQRdWbCQasc/
	pL6TI9sHLIMifBmj3E1Irmoo+5KUUgX7qq82yLaUvrSej7hunmK3RQlkLnSad2zWB/vZ3v73z1P
	IkYH3u0UDscdGY=
X-Received: by 2002:a05:701b:2089:20b0:14a:d8fe:33a4 with SMTP id a92af1059eb24-16a60de40ffmr21156321c88.38.1791927857405;
        Tue, 13 Oct 2026 14:44:17 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:7482:1179:c0d4:b9cc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm52932676c88.9.2026.10.13.14.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:44:16 -0700 (PDT)
Date: Wed, 14 Oct 2026 03:13:39 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev, gservice341@gmail.com
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <as6mC7sZnpqIKxN6@user>
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org>

On Tue, Oct 13, 2026 at 03:11:51PM -0500, Alex Elder wrote:
> On 10/12/26 9:24 PM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Use %pe to print error pointers directly and display their
> > error names.
> > 
> > Keep the other PTR_ERR() call because its return value is
> > needed for ret.
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> 
> Generally I think what you're doing is OK.  It looks
> like %pe is better than just %d, because it prints
> the error *name* for the pointer-coded error.
> 
> But I have two general questions about this effort:
> 
> - There are other places in the Greybus code (even in
>   just the staging source files) where this exact same
>   thing could be done.  Why limit this to "fw-core.c" only?

I initially limited the change to "fw-core.c" because I was
focusing on the error messages in that file.

> 
> - Do you think that all Greybus error messages should be
>   converted to use %pe (passing ERR_PTR() if necessary)
>   instead of %d for showing the error number?

Using %pe prints the error name instead of just the
error number, which makes the error messages easier
to understand.

For example, the current message is:

	failed to create download connection (-12)

with %pe, it becomes:

	failed to create download connection (-ENOMEM)

I think the second message is easier to understand because
it shows the error name instead of just error number.

I also found other PTR_ERR() calls in Greybus. some of them
are used to return error codes and should remain unchanged.

For example, in fw-core.c:

	if (IS_ERR(connection)) {
		ret = PTR_ERR(connection);
		dev_err(&bundle->dev,
			"failed to create management connection (%pe)\n",
			connection);
		goto err_destroy_connections;
	}

Here, PTR_ERR(connection) is needed to store the error code in ret
for the error-handling path, while passing connection to %pe makes
the error message more readable.

> 
> I think your suggested change is a net positive, but
> doing it in some spots but not others means it is
> adding a bit of inconsistency.

I agree that similar cases elsewhere in Greybus are worth
checking to keep error reporting consistent. I will look
at the other Greybus files for cases where using %pe would
be appropriate.

Would you prefer me to extend this change to the other
relevant Greybus files, or keep this patch focused on
fw-core.c and submit a separate patch for the remaining
changes?

Thanks for the suggestions.

Pavan
> 
> 					-Alex
> 
> > ---
> > v2:
> > - Use %pe in the firmware management case, as suggested by Jeremy Clifton,
> >    to match the other cases.
> > 
> > v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
> > ---
> >   drivers/staging/greybus/fw-core.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> > index 2016a74f137f..78321be80013 100644
> > --- a/drivers/staging/greybus/fw-core.c
> > +++ b/drivers/staging/greybus/fw-core.c
> > @@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			if (IS_ERR(connection)) {
> >   				ret = PTR_ERR(connection);
> >   				dev_err(&bundle->dev,
> > -					"failed to create management connection (%d)\n",
> > -					ret);
> > +					"failed to create management connection (%pe)\n",
> > +					connection);
> >   				goto err_destroy_connections;
> >   			}
> > @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			connection = gb_connection_create(bundle, cport_id,
> >   							  gb_fw_download_request_handler);
> >   			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
> > +					connection);
> >   			} else {
> >   				fw_core->download_connection = connection;
> >   			}
> > @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			connection = gb_connection_create(bundle, cport_id,
> >   							  NULL);
> >   			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
> > +					connection);
> >   			} else {
> >   				fw_core->spi_connection = connection;
> >   			}
> > @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			connection = gb_connection_create(bundle, cport_id,
> >   							  NULL);
> >   			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
> > +					connection);
> >   			} else {
> >   				fw_core->cap_connection = connection;
> >   			}
> 
