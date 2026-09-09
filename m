Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8993528640B;
	Wed,  9 Sep 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939857; cv=none; b=tdau0cyYwt0OfpGqfkURAnful7Mz1jSdAHWfD+xWt/aPuhLgN7aygb9gc7oJ1RUypI/nbRAmdXgYvpmOeuNv/HTQFD7lQ3eIdy7M1LqsW5l+L74RwMGXa0zHkB9E4nioMBaf78NjhwPxXKweWGIg0rLM0A3EjG4BeG0JDBcqwBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939857; c=relaxed/simple;
	bh=iTyTBCeUw9UQcVoNs87RbRXOf4GIDEY/BYnKR7Tu5sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmGDZziyjUZGN2lBxJj0brb9pkCCjDwnFX/FFDgrzsWggbqKgF4IAw99fs1S4rtvbIiKsrNGo7LVVzNK1WAYVUawaY6BkDbs3aJikPc9YkZ30gsgIDpEiSAUsUraekjAM+HQHppYfsnzz/t2hLZYUoRFF0M1JCverm3iIpVx/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AIFeLgwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AIFeLgwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827381F00A3A;
	Wed,  9 Sep 2026 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788939856;
	bh=zUiAd5/QSL6PU/JU3Ptv1wuaq5f0uVT+jsfnDw718tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AIFeLgwDhNom8h3pABxMwNX1of1qnoB5Wy+iq20c3FRCHSr2viaFJTdKfDUk450pu
	 YmvCppVCwJtNi5nk86CtxtbS7qvyAkbAWL57J99aJ577TTqL3fj5muzRwx5WV54mXS
	 +ekqOCiz7RqKJM91ZN0FIYWgk1B0K24Zg7JeFTPQ=
Date: Wed, 9 Sep 2026 09:44:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tianchu Chen <tianchu.chen@linux.dev>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix protected RX frame validation
 in decrypt path
Message-ID: <2026090919-stammer-outclass-5c6f@gregkh>
References: <7848fcb635963ddb8474924ed71fdd687b5d6ec7@linux.dev>
 <2026090714-sneezing-unrated-b0ef@gregkh>
 <aa1496d71e0867c1e04f6442ab97520f531531ca@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa1496d71e0867c1e04f6442ab97520f531531ca@linux.dev>

On Tue, Sep 08, 2026 at 04:02:15PM +0000, Tianchu Chen wrote:
> September 8, 2026 at 12:13 AM, "Greg KH" <gregkh@linuxfoundation.org mailto:gregkh@linuxfoundation.org?to=%22Greg%20KH%22%20%3Cgregkh%40linuxfoundation.org%3E > wrote:
> 
> 
> -snip-
> 
> > >  
> > >  drivers/staging/rtl8723bs/core/rtw_recv.c | 21 ++++++++++++++++++---
> > >  1 file changed, 18 insertions(+), 3 deletions(-)
> > >  
> > >  diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > >  index 7568fc514d7ce..4756e0fedd46f 100644
> > >  --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > >  +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > >  @@ -426,8 +426,21 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
> > >  u32 res = _SUCCESS;
> > >  
> > >  if (prxattrib->encrypt > 0) {
> > >  - u8 *iv = precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
> > >  + u8 *iv;
> > >  + u32 min_len = prxattrib->hdrlen + prxattrib->iv_len + prxattrib->icv_len;
> > > 
> > Why will this not overflow?
> 
> The overflow(without this fix) happens inside the per-suite decrypt routines
> when a received frame is shorter than this minimum. For example:
> 
> rtw_aes_decrypt() computes length = len - hdrlen - iv_len, so a
> 30-byte frame with hdrlen = 26 and iv_len = 8 wraps length to ~4GiB,
> and aes_decipher() then iterates num_blocks = (plen - 8) / 16 16-byte
> blocks, reading and writing gigabytes past the skb.
> 
> The WEP and TKIP decryptors start from the same subtraction and
> underflow the same way. 
> 
> min_len is the minimum size of a legitimate protected frame: header +
> IV + ICV, plus the 8-byte Michael MIC for TKIP.
> 
> The min_len computation itself cannot wrap either: all three
> addends are u8 fields, hdrlen is at most 36 and iv_len/icv_len are
> per-suite constants (max 18/16), so the sum stays below 80 even with
> the TKIP +8. A frame shorter than min_len cannot even hold its IV
> and ICV, so only malformed frames are dropped.
> 
> 
> > > 
> > > + /* TKIP appends an 8-byte Michael MIC that icv_len doesn't account for */
> > >  + if (prxattrib->encrypt == _TKIP_)
> > >  + min_len += 8;
> > >  +
> > >  + /* a protected frame must be long enough to hold the IV and ICV/MIC */
> > >  + if (precv_frame->u.hdr.len < min_len) {
> > >  + rtw_free_recvframe(precv_frame,
> > >  + &padapter->recvpriv.free_recv_queue);
> > >  + return NULL;
> > >  + }
> > >  +
> > >  + iv = precv_frame->u.hdr.rx_data + prxattrib->hdrlen;
> > > 
> > What prevents this from overflowing?
> 
> The check above keeps the offset within the frame: it guarantees
> len >= hdrlen + iv_len + icv_len, and iv_len >= 4 for every suite, so
> len >= hdrlen + 4 and both iv and the iv[3] dereference stay within the
> first len bytes ([rx_data, rx_data + len)).
> 
> 
> Those len bytes are in turn inside the allocation: hdr.len is set by
> recvframe_put() only after pkt_exceeds_tail() verified that pkt_len
> bytes were actually copied from the RX FIFO into an skb sized for
> them (rtl8723bs_recv.c), so any offset below len is inside the
> buffer.
> 
> This is also why the iv assignment moved: the iv[3] read that follows
> it would otherwise be an out-of-bounds read when the frame is shorter
> than hdrlen + 4. The IV may only be examined once the frame is known
> to actually contain it.
> 
> 
> > 
> > thanks,
> > 
> > greg k-h
> >
> 
> Regarding the format issue being mentioned earlier, I can send a v3
> patch. Also, I believe decryptor() is also where this check should belongs. 

Please send a v3.

thanks,

greg k-h
