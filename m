Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651729;
	b=sTUn2Q/UO3hPY4Xh3O8aXkbEqxOl/wAIZsNSVhjOdQ83uPHGCBA9qk+ErbrDuxUHYmgB
	 CH+1O7Sgl052lbkPQdUp5D0/F4lOmEnn7fvulwgUWpoJZk86M4n04Mmc0yMXpXrMuUawG
	 zXJGNPEFilXPo1FDNr9dG/G1iSLnPnBdc4aRVSlcYmFDbmfldkkrfU2B6rqq1hCrlR5BM
	 Mr6WZZ1VjVJaV2Qn40Akw1pe/JI4eLfO3HciIEJVfSl2R9CGyXBG9yKHiKLhWBtw0ZNgL
	 2ux/xigvmZK0W9UXbXpab4Xw/l9+u8pLJT6E13KMoh+mAsWjOgfqANIeqpwBza4brDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651729;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=bhYmcrNs1/zn7fkwdgdSH+1E4lKXaKWEZkf3gb/jh5U=;
	b=2GEF3D/54exL/tXaOKtG7kKcQNMhMV7EXOFBD9j5zHOr4Q6LGXixNe39AMhlMxyOv+xK
	 54/j+c9GZjPX+GOTDLsOy9CWfHe8hcCUSyMEhmV5CoTvYMz0KZW9rtVWIMZJSa+ZJOsPy
	 QS/8Tzq1pj675kMWNyPp9SCn04o4zAoTWAEYOYHyBLPCDOFBMnyB3yUGsKzHarYotS0Nx
	 DwECVGCrkxsUMdTonloPY+cANMbwDr5/vABCiJuM9GBvQ+wbQ4t02KZIzchIV3OhKr9CD
	 y0oUmsEGXaFDWjZGarx6BVkbzBtLEef9NTIWAJ2v+8u5IEyK8VyAVwL/O5KYvqW4TTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nW9p1YEB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339F606A319;
	Thu, 22 Oct 2026 06:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nW9p1YEB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76E01F000C1;
	Thu, 22 Oct 2026 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651728;
	bh=bhYmcrNs1/zn7fkwdgdSH+1E4lKXaKWEZkf3gb/jh5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nW9p1YEB2nxuUJjVZ8jb2nnwI4GsGb31q/ZVjohIctEuDUjgkevUbhY0tX/FLHWUk
	 D/plA9FVnxTb+vJN1AV8pEnzcDlJu6c8aJFFTgivoS9n6qopo8rHeNufIalofO7rLL
	 rYNQoaZW5vStoYClZy79UoK+Ua4MiAnvT8S9WUbIu/pdaGmQxHR8KW8E5sIaHrvsK1
	 wFhbmfBDvLXcUqYFT+j+Eh1HlUtQgKqbgw020Cv9dxUwtw9Li2on5y9U8ab2BWDLRv
	 2WB8FHomdg40CTeoQZBNR/VoKYYwSV68XZZ1p1nE9qOREm2iBWfXeOybZvlodVS8+r
	 LXMgFKv5SQlJQ==
Date: Thu, 22 Oct 2026 06:48:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
Message-ID: <atmxzUwkWj0C7aZM@google.com>
References: <20261008134056.3816556-1-akuchynski@chromium.org>
 <20261008134056.3816556-2-akuchynski@chromium.org>
 <atDD1RHZylPRZtP8@google.com>
 <CAMMMRMd6qd7-kBEOs8L2f4u_Pd9WbDc0dwM1MD2mrKTN9CzPEQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMMRMd6qd7-kBEOs8L2f4u_Pd9WbDc0dwM1MD2mrKTN9CzPEQ@mail.gmail.com>

On Tue, Oct 20, 2026 at 11:12:03AM +0200, Andrei Kuchynski wrote:
> On Thu, Oct 15, 2026 at 2:15 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > On Thu, Oct 08, 2026 at 01:40:55PM +0000, Andrei Kuchynski wrote:
> > > @@ -421,7 +427,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
> > >               memset(&desc, 0, sizeof(desc));
> > >               desc.svid = USB_TYPEC_TBT_SID;
> > >               desc.mode = TBT_MODE;
> > > -             desc.inactive = true;
> >
> > Why this is removed?  Per 1aede0698167 ("platform/chrome: cros_ec_typec:
> > Disable tbt on port"), it disables entering TBT mode automatically.
> 
> If the ap_driven_altmode parameter is enabled, automatic activation of
> both TBT and DP will be disabled via the mode_selection field. Consequently,
> deactivating TBT via the inactive field is no longer necessary.
> Alternative mode drivers within cros_ec_typec are no longer needed to
> trigger activation.

Ack, I see.

> > > diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> > > index 66c546bf89b53..116329dd113f8 100644
> > > --- a/drivers/platform/chrome/cros_typec_altmode.c
> > > +++ b/drivers/platform/chrome/cros_typec_altmode.c
> > > @@ -41,12 +41,16 @@ static void cros_typec_altmode_work(struct work_struct *work)
> > >  {
> > >       struct cros_typec_altmode_data *data =
> > >               container_of(work, struct cros_typec_altmode_data, work);
> > > +     int ret;
> > >
> > >       mutex_lock(&data->lock);
> > >
> > > -     if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> > > -                           data->vdo_size))
> > > +     ret = typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> > > +                             data->vdo_size);
> > > +     if (ret) {
> > >               dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->header);
> > > +             typec_altmode_state_update(data->port->partner, data->sid, ret);
> > > +     }
> >
> > Wouldn't it need to update the state even if !ret?
> 
> No. The typec_altmode_state_update() reports whether the activation of
> altmode has been completed or has failed.
> If successful, typec_altmode_state_update() will be called from within
> cros_typec_configure_mux().

Ack, I see.
