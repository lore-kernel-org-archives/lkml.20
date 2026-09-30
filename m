Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28B37AA95
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794511; cv=none; b=HICNjtjhpb9nuTbq/2MbrQ/t3w8u6JwMyKBJ08ekBqoHx1ZIxdgyxJZ/XyseV9CZpyn0zLPQzYBfYnafGhdJQPPIQoflBUisDeSy6P/9Z9RQaWSuF2k3HTANAj8i2qQcThxyaUctGZFeCiG8mPgY45960xQD343fGj2ghqWtL3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794511; c=relaxed/simple;
	bh=cswiScNE3E9pNfXIpCP4WFi2Ae4RTtKOoPD0b7LSKkY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UnUs4c4EIdCmy4L3B0o/KKEkKyVKufFrOdTI35zXvtRJ7AL0jTGedSPg9/JWtRzafFyX4rQKyF3AurDNOWuuYdDb303kwSYukcFF22khSfE+zXXpfMcXQNBLBzTK8LUS6JBoIlv1Dvr2ITjbv9PXa5GZI9dRmWDq5lPiIp1NmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DUFGOUt7; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaslanka.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DUFGOUt7"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c25501f4aa2so312641966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790794507; x=1791399307; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xK4JYgRtStNo4V5zoea2qHX3qmnjaW/h2fp97VQUzUk=;
        b=DUFGOUt7UdZ7rfHx5hyx+matXCsyiNPoyyWv4So8oeZLzT5lx7ReBMM6mICuHSE3zq
         ePDjqiL5zHN+XjQuYthG029Alds1Q0WcrD35BXcLo4dJ3HShLOE5fn6+QnWYaXmbWVZV
         EYp+XVhUEQEnpp+ku5mov1ELNqYaHr1KpOrRC24udH9iUEwDLne8TfFy37Hcrg5jdbyb
         uDzeOCLaH3QwaYYGKE1uVtEnZUjw2wVEH+HDRWnmL+djqVl65jX0JFMftRXFVoQMoV3z
         be6/qXdT3ojxles49N5dx7rd7TjG6EJWaS/qMan2mNOjkm5VV6/ttVHFtirbbyT11fCy
         f0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794507; x=1791399307;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xK4JYgRtStNo4V5zoea2qHX3qmnjaW/h2fp97VQUzUk=;
        b=M71k1Zhdc+gLGfItzemUYYKDaMwh1LkDXOVOZjY6GZ9vB3uiJPbusKam2ucgIJHZtq
         1aJyWJD8no7f6XHSj9QXfdevp1U8d+grMIZg8H7yBg3qhrDpTxLvs+st5K48ajbr+1j/
         WcZBnDgbpHHc8hcDb+bCBaNtaKihoOKngLUE+75I3ZwO139yUXzF5x1L7t2+9LpwZ3Dq
         0DgBrR/zDYlHnDnyin/3xWnf+QHX0CZUi/Ist1GV5EyOV5ja6MSN2yu/1gnPFam9l61v
         C+ASf5DMJMXH/8Zq20oEmUYwevVlpUJLYYd62fLNfIiibWjnbh/t1UnM74n44A2tyBJC
         0cXg==
X-Forwarded-Encrypted: i=1; AKwUvBzhYAf+eaN+iQLyYj65rg1K354ldxa1ed/6UUd24pRmaLWcs6sMRBLp1M31EskoMbaog1z9o5uBGSNGxIs=@vger.kernel.org
X-Gm-Message-State: AFuF++nL8XvGGyMk7C9IRTX5g6Q7AkzaUfv8gZrCdyPZnjdp4rMrFUtF
	1QJXovy5wcaUllY2t6m2WY8Vj5vUWC8CkSdz56eFt3okainCSpKDArzo5A5fD/nHaNrXQIdi1jP
	Sg4GD1d0ChYs9oD7E/Q==
X-Received: from edvm11.prod.google.com ([2002:a05:6402:50b:b0:6a8:1d4c:399])
 (user=mmaslanka job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8997:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c2e33ef130cmr47630166b.11.1790794507256;
 Wed, 30 Sep 2026 11:55:07 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:55:00 +0200
In-Reply-To: <art-pgdLHXiCm5l4@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923174420.2343724-1-mmaslanka@google.com> <art-pgdLHXiCm5l4@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930185500.198456-1-mmaslanka@google.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Poll for role swap completion
From: Marek Maslanka <mmaslanka@google.com>
To: tzungbi@kernel.org
Cc: bleung@chromium.org, abhishekpandit@chromium.org, jthies@google.com, 
	akuchynski@chromium.org, groeck@chromium.org, raduvele@google.com, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Marek Maslanka <mmaslanka@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2026 at 09:02:30AM +0000, Tzung-Bi Shih wrote:
> On Wed, Sep 23, 2026 at 07:44:19PM +0200, Marek Maslanka wrote:
> > +	req.swap = USB_PD_CTRL_SWAP_NONE;
> > +	end = jiffies + msecs_to_jiffies(ROLE_SWAP_TIMEOUT_MS);
> > +	for (;;) {
> > +		if ((resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED) &&
> 
> Shouldn't PD_CTRL_RESP_ENABLED_CONNECTED remain set during the entire poll?
> 
> > +		    cros_typec_resp_to_role(&resp, swap_type) == target_role)
> > +			break;
> > +
> > +		if (time_after_eq(jiffies, end)) {
> > +			if (!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED)) {
> > +				dev_err(data->dev, "Port disconnected during role swap\n");
> > +				return -ENOTCONN;
> > +			}
> 
> Same here: if PD_CTRL_RESP_ENABLED_CONNECTED isn't set in the loop, should
> it return -ENOTCONN early (i.e., out of this if-block)?

Yea Right, thanks. PD_CTRL_RESP_ENABLED_CONNECTED remains set
throughout the role swap in the EC (both TCPMv2 and PDC keep the port
in an attached state while a PR_Swap or DR_Swap is in progress).

The original reason for checking PD_CTRL_RESP_ENABLED_CONNECTED before
comparing the role was to avoid misinterpreting a cleared resp.role (0)
on disconnect as TYPEC_SINK or TYPEC_DEVICE, but checking
!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED) at the start of the
loop and returning -ENOTCONN immediately is much cleaner and avoids
waiting for the timeout when the port disconnects.

I will update this in v2.
