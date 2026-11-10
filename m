Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346174;
	b=G+qRbfKT5b0gh3dSf1Nex69Y6tHNuCE1PjTOBtUQr2xRV8aUKTv9eun1MTFcaHO2SiZ4
	 eVemDgzwDALANgsPPQhzGv/oxbsYJJ1xy85GG0YYaoh0N1N4C2N29IAtzsmosdfkBTdE+
	 O05TFRej4bv01RfOMCOyeC1F4pdrRmc6Hc90jEM0wA1JGlWcCMrMaMKdq0H+VH726mr++
	 GGOvFlkMiu4u7smP4Kc2cvDRorOwzzafIsGP1wV8aXyVavpmJhilqhw7lGk/Oo1+Rzrmi
	 m3M1TRD4CcQ8lHBxBysUOa9GiLoYMkYpfCAl36Y6QjNLyctCGf6nsQkYov8upBUJ/Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Eg5VsLzGVepVcCiWSJ+3AWApPfh5rapdrU4mGxcNLPs=;
	b=AMQAQvCrXXwqXYIzLnOhaWu1Xbn5kESQG+o+V9Hupxr1RRR9dcYNnw2qdqM2nhdDJs2Q
	 oDKZ/dGZDfSDsxDUQrqkJsu7T1lPIftTZB6OnmwUq4krOCZu9HsG3dOyZ76CN6wb4J+Nd
	 qdZwehSQQo3pD0pKWHUJPLXTx2R6PATpxBuOBW3fJYEtBYYL37qsseTfzBokwhd1MIJ0p
	 5BIsZzYMPfDvz0LxlxZcNcUPV44MgDqfnRMnvOClEMDKj5U3JqbIiRQZKwhNOPO9bjVQV
	 4PFP0YyhR5ze9180sZx84tp6JubqpUqwexpR64rCczJlL3QSywFVCSo/U5oAUKwHTUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ngxAJsb5;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372B1606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ngxAJsb5
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53cd0c8614eso17151061cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794346173; x=1794950973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eg5VsLzGVepVcCiWSJ+3AWApPfh5rapdrU4mGxcNLPs=;
        b=ngxAJsb5ELadmYPUOERBykB33SXa/Efwx4bOV7nsdg0Ebx5k+PW9DL9x7a764ATk5w
         dH3i9XrOhO7xby8MwWtLE3652SbSQPRFXaQXItbPFOSd/hbJdDiZyus7HYbO4nx2mrYy
         CFI64A2ENEGoG6zkvsKyiT15SXZsJGVCWs5aPi7ykBzROuBC3DrKOS9/CmnlD4kKgvh1
         lzfHraC9l/7svjpZsqtoNS3OvVmHHRUNYi4izEa9nHpXRCXJ7/QE/9xbE99rR4qt2vxx
         iZqdmzjd4HazbyvS3qOb5ZwQr8/gHksjITWrxZEa0LA4uaKkRrmppNrcHshyVFi95ivF
         k9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346173; x=1794950973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eg5VsLzGVepVcCiWSJ+3AWApPfh5rapdrU4mGxcNLPs=;
        b=vfA3aTq4tQwTykTd/zb0iaiADPuetfhIgyDadtVOUJ+h82ibSQnNraGbx87UDtp027
         JHl8bGnN/uSvcBZn43g7P7BDl/bf9nxvR595kU4+MU6QVA6EvyjrcU5WkbWVimg6P+ox
         UDQuwaazVDDdiZFrW5IFvBi0irEEll9en9uJFYUm3J6V+3bvnDjP7T66JGt+9m5CfAzZ
         n+/qGKg3h2wZDa6KvSB+RvyOVhTYAAm2kPXudmRpU8XIQw/mqt3Ek3QJynSmkN0SMee/
         KTHqfzZwBEgmlprKB1NJZK63B+oPuKBpsMY0TkB/scSnO77meSiCfV41D7aH36DZgQrZ
         QQpQ==
X-Forwarded-Encrypted: i=1; AL+hErEA0QLSyNtGJYxj/AnA+EXovb3G2vbqhgSm1inPKEmeoL88lb7UsVLbxszzghJcHED6d67Ww2Edkpp/VF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kEFGq/47qc1tTUNP94vpI+ca+iC6z0RFodg2GVfUufyZQSbXJ
	x4g22a8ZqJG1ftyKigC6tc0Lf7DMFGwe4XKpFuZWFuAlmZQwjQ44l3ymqyax8mao6Q==
X-Gm-Gg: AYBFou19m2Kxii1TY2HbHF/b6t1e14XgUE8B10VA0HvHHM9PGE2cw40UUvuyQDcvfmo
	fhq8QhZaluqlOnfu0eGRisjjOQ0TYq0/0htQTCIIJs073VA3jmz9FsHFxBue1AdOdvuNH/NaK++
	9c1tRkieQnWpFoIYJ/aiZWBlPk7RvjTKbh9c4Ko4xfEAY29BHpKAtpKOtpdhOFzJPZgmE+n1yij
	igKVrrkSpNJCnrFauExMbVf6ZYr70G7XJ/T0KI7jlqB2GhKbwJxGEcfitZ0dpn5JhJrpIczURsL
	xmzpoCnn9AZPeT8LiQtOF2NAxKOs4Dd+r88Un+89fXFV1Dq9O7aHV80zXjg1S58biGuJ9Lv/2Xq
	WyKszXTYte8oWEo8kqFjSstv+TC7f1QhEPqr7s2netTAV+5KTy1E3KRECxDp+w/AA4Gvcz8ZA8y
	Aj/lzbK0ItvRQ5K40k6y//S9TJDShaV7gtjsGzDWkRNmZcWV4dy24lpT4xiG77y1Z4AohtxQapP
	sK/zo5T+nrJ4EgG5ERvf19xjev64YZlmaWpXC4h5+8NG8T7cde89Wf0aXqHadAh8yJ4R32NjdF2
	Zb6P6tA88HSdjsDkRACAZc+yKwpMzg==
X-Received: by 2002:ac8:5a15:0:b0:535:a5fa:ee05 with SMTP id d75a77b69052e-556c1775f23mr2040961cf.69.1794346172734;
        Tue, 10 Nov 2026 13:29:32 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bf2cf01sm33588241cf.25.2026.11.10.13.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:29:31 -0800 (PST)
Date: Tue, 10 Nov 2026 16:29:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Cheng Yongkang <teel4res@gmail.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
Message-ID: <94436653-ae58-46c9-a2cf-241231ac8eab@rowland.harvard.edu>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
 <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
 <179333358668.2111112.12827497703998022783@gmail.com>
 <3648026e-e93b-4543-87db-e56020770831@linuxfoundation.org>
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
In-Reply-To: <3648026e-e93b-4543-87db-e56020770831@linuxfoundation.org>

On Tue, Nov 10, 2026 at 11:57:34AM -0700, Shuah Khan wrote:
> On 10/29/26 22:13, Cheng Yongkang wrote:
> > Hi Shuah,
> > 
> > Without this change the URB is still completed to usbfs, with status
> > -EPROTO but with the peer-supplied actual_length intact:
> > >    vhci_recv_ret_submit()
> >      usbip_pack_pdu() -> usbip_pack_ret_submit():
> >          urb->actual_length = rpdu->actual_length;   (usbip_common.c:471)
> >      usbip_recv_xbuff():
> >          size = urb->actual_length;                  (usbip_common.c:849)
> >          if (size > urb->transfer_buffer_length)     (usbip_common.c:856)
> >                  goto error;  /* rejects the packet, returns < 0 */
> >      urb->status = -EPROTO; goto error;
> >    error:
> >      usb_hcd_giveback_urb(hcd, urb, urb->status);    (vhci_rx.c:107)
> >        -> urb->complete(urb)                         (hcd.c:1657)
> >        -> usbfs async_completed()                    (devio.c:1911)
> > 
> > usbfs copies data on reap whenever actual_length is non-zero, and does
> > not look at the URB status:
> 
> It sounds like fixing usbfs to check the URB status before copying
> sounds like the right fix.

No, that's not possible.  A transfer may terminate with an error partway 
through, after some data has been sent/received.  The URB status would 
then be a negative error code, but actual_length would still need to 
reflect the amount of data that usbfs has to copy back to userspace (for 
an IN transfer) or tell userspace was sent (for an OUT transfer).

In general, the USB core relies on HCDs to set urb->actual_length 
correctly even when there was an error.

> Changing vhci to zero out a filed in an URB that it received, itsn't
> something we want to do. Why not fix this in usbfs and that would work
> for other invalid lengths?

HCDs are _supposed_ to set the actual_length field in URBs.  It's not 
a mistake to do so.

Alan Stern
