Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334864;
	b=nZv5ushcsGrzvApml1Isp2V2RQ+cXJs49RhkS57jZpSHKch5Z4DuGYKNXL7Gvq/dkVY2
	 HUiRzvJQUeM6QUVfp790jXNx42X44DGdewVk1oL2b/6ZzeaFx1nDPC66yVpDm3gec/Dwa
	 jvc/6NIdeREq0gikNvQRqf0VyVHU1ymHkCVEkeePidexuetHiIScHQ2g0HOKo98Q9NVXx
	 2oBr3ieLczlvUwLgqg0XdmOUsL1NUBNLWj12SBnmQsVuM+zSh65RqEULfF2jfhCt4DOi/
	 wCEelfUWW4MgSLfRYdVEAJ9SClQNgj8vHhcctPa/YGqY7nqYEAd4aFyc7m8hnxv/Fxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334864;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fV0CHpd4GdUMteugWLcIsYrdIucekIRCl0bvZtdLPQ0=;
	b=nTi1ssd/fX0gS3toir1YMcZXahqYDERemVI5t+jFZHoQ0IwXKoA3yp0ydE0/Wae6cJVj
	 URT8pG/QOQsfihDDTvjMgqlFy6fy3683ThnTF8r7S8x1t/134SY+O88tGenSA83lkke98
	 vC5lU0c5oSpTkvJyggKdAZ6TEXBb+MgGWoai//f6Vh6aPvpNaJTJAwwARx3WYMBY7MlEw
	 P8n0/VfIhiGGNPAsgjVv+bkHSqYDb+rhJmlQeGGkHmWoTyDv7cmLPElueseP2Wp9RnFXD
	 b1LcDZA/Nlp1kyCR8/khO3fEkoMjzLMzWF3sBA1J3EiXmaUxZKHs2cvNey+IcBdIbJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yleqlEpg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF52606A320;
	Tue, 10 Nov 2026 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yleqlEpg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3565D1F0089F;
	Tue, 10 Nov 2026 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794334863;
	bh=fV0CHpd4GdUMteugWLcIsYrdIucekIRCl0bvZtdLPQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yleqlEpgVolSOIsVsH8PGR5sAa5b7qADEq03UUlGeTZf2/IC+23znJPr5KSG6vPRJ
	 MhjGdAJB07HFQA20df8RHJux4ejUPxJm4GNJwScRbP8UZ6VjDFm4JEbg1mUs9EuWy4
	 QJmjFA0yoyyhcPoA6ynoG2+6+vRenRtUad5xVWec=
Date: Tue, 10 Nov 2026 13:21:02 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: mdshahid03@gmail.com
Cc: starblue@users.sourceforge.net, legousb-devel@lists.sourceforge.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: legousbtower: use stream_open for stream semantics
Message-ID: <2026111054-reversing-gurgling-94fd@gregkh>
References: <20261028182802.25212-1-mdshahid03@gmail.com>
 <179433189678.152716.11457478975708955224.b4-reply@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179433189678.152716.11457478975708955224.b4-reply@b4>

On Tue, Nov 10, 2026 at 11:01:36PM +0530, mdshahid03@gmail.com wrote:
> Hi,
> 
> Could you please review patch and give your feedback,when time permits.
> 
> Thanks
> Shahid.
> 
> On 2026-10-28 23:58 +0530, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > The LEGO USB Tower driver uses nonseekable_open() in tower_open()
> > However, its read and write have stream semantics.
> > 
> > Use stream_open instead to mark the file as a stream and disable
> > unnecessary file position handling.
> > 
> > The issue is reported by stream_open.cocci script as potential
> > deadlock between read and write operation.
> > 
> > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> > ---
> >  drivers/usb/misc/legousbtower.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

How was this tested?
