Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848A856855E;
	Wed,  9 Sep 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961468; cv=none; b=Uim5g9OvZADQ1UJzp46e6rtSYUKfVnHyTvmvmydwVyCGA1+1q11RGsKrZy2T0g2dRtXBLHsdsp9A8ESLdc95GDEMxTVPXvtnSQmYrefBnsmJ3n1rkst1kA+WxNHBI2uI9+cbn3Eltpi0XnybOufAjaDxVjqRmp1A8JRIQKzm8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961468; c=relaxed/simple;
	bh=BSVQ7X1oYMYkr3cY9M4eIo7reqFxHTRsekGLejEdsS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1O6Al6euYR1fHWT4xR5UrGevwSunzvRJ1FSXGHSzy+r5RueWh2CT5T5tF39syrQVIFNVPia/Bkqwh7FbTfw2bAtGb8+OgR11fwDuIDjDR9MIhuiy94arL0TWBC8RAD6mxQK5UYjnD3PjSk75YYvLO0+K9Tva1bCDNWExBj3twY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bFbt+CVC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bFbt+CVC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9006F1F00A3A;
	Wed,  9 Sep 2026 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788961467;
	bh=q382t19dmeDfi6w9s1tlbESymUMmrB4fPz5zaEdPuaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bFbt+CVCO/5PMUnbI9Fl0tG5znsZ0+zp3Uku8Xd9YW896CydUazkSNUejspdflrxS
	 Nbjjoh6b4U6cEzyOYYRArj+xCQZnOcfoWFL36t2FN9JVk8Ek1PNkuMRT/FrtetewNm
	 VIup4Qmd/9kjscc5e0PLngIYxt8Yi0daLitT8qqk=
Date: Wed, 9 Sep 2026 15:42:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Isaac Aneek Sarker <alvasarker2004@gmail.com>
Cc: Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Minu Jin <s9430939@naver.com>, Anirban Bose <boses156@gmail.com>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix unnecessary else block with only
 a break statement
Message-ID: <2026090926-nursery-despite-185a@gregkh>
References: <20260909083010.13064-1-alvasarker2004@gmail.com>
 <2026090924-tiger-unaudited-e9f3@gregkh>
 <20260909193736.3d7a851a@isaac-aneek-MS-7C52>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909193736.3d7a851a@isaac-aneek-MS-7C52>

On Wed, Sep 09, 2026 at 07:37:36PM +0600, Isaac Aneek Sarker wrote:
> On Wed, 9 Sep 2026 11:33:49 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, Sep 09, 2026 at 02:29:38PM +0600, Isaac Aneek Sarker wrote:
> > > Warning found by checkpatch.pl : else is not generally useful after a
> > > break or return. The function would reach the break statement after
> > > if-elseif block even if the else block is not used.
> > > 
> > > Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > index 3c82012fdc6c..a203ef8bd6f6 100644
> > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > @@ -1789,8 +1789,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
> > >  			/* Duplicate entry is found!! Do not insert current entry. */
> > >  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> > >  			return false;
> > > -		else
> > > -			break;
> > > +
> > > +		break;
> > 
> > Did you test this code?  It looks like you now just changed the logic a
> > lot, right?
> > 
> > thanks,
> > 
> > greg k-h
> 
> No I didn't test the code. And I don't have the required hardware. But I would like to know what are widely used test methods in linux kernel dev to test a driver when you don't have the relevant hardware vs when you have one for and finally test the code. At first it seemed a trivial change to me because that else block would only execute if the if-elseif block didnt execute, which made me come to the decision that the else block was unnecessary.

Please wrap your lines :)

Look at the logic of what you just changed here, is it identical to what
was present before your change?  If not, what is different?  checkpatch
is for coding style issues, not logic changes, right?

See the mailing list archives for many discussions about this type of
"cleanup".

thanks,

greg k-h
