Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C14772BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351986; cv=none; b=VdNo10SMxMQ2cHxLLPzTZ+buw8kYBqb0Khm+EvPyFtrTlaggJuLlC6HM+TATtUbQxtLFbghLhYZA5P6yPkSRMUPwzCafK3usV2nRxF78LZ07aC1WdAlxDVq5/kOLEeA4NL6Brpyl+BIo57bYuV1C4G7nC05Ut+FAYZ2J3vveOwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351986; c=relaxed/simple;
	bh=GGMv4HynLli8bREmQlA1qhtM4tuVmiPhtmA+2Os+GWg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWJJnh89sbpqa7tn/N0tvbTzAuuiOSkoriqqOFNnkgpNTnCkzf1ZywZVApcnnQYMr7OvDwnLrpxQ9wTsrWzzbBXcmUtdwe7FqZB6mMDpOn59luGoQ45QzbLc1zQjNhTkYkk1nF0pgvBCjnJAverWpvI+BfRc91MrPnN126WCuT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOG4PNOv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOG4PNOv"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so1025600f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351983; x=1788956783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=036mA8orffinoqt2iQHKcFlBXTwc5/7dbRbRMf6syWk=;
        b=OOG4PNOvdvbjkC4Q3CxzZiBk7P89PJ/ZiKl6kaTj1tlyyKtf9kH8gbDUVPFhMDThqC
         PHB3MsYwq7kid+SfguG198F3nMxfbqml91rhSkMVO4wl6Fr69L9hn/2zIXXlXqE1nQZ4
         E/bzMAP0eL4nKaZ3YpeWVyI36Qt/2QVJ2vUxxRsbVwNPMIy4h4yhalmlUewi5roEyYlu
         6HKGgq+lUlxhaxKZD+iC11aaR4LfjipJ+YnqndIrFLLK+DaulyE/rXjIXVICtrMnoZi8
         XqwnXr3olbUPB9MiirluQx+XCyzTX2Hze3Jv76UkfbD61u2qXtgKj2jDxCYfH8aOuoAk
         m8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351983; x=1788956783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=036mA8orffinoqt2iQHKcFlBXTwc5/7dbRbRMf6syWk=;
        b=V26TyMwokqzz3IyeC3mMVOesqkqdA79joeYBq8Ex+vZvEuhAzOLc5lGpx13sdbLCRm
         CLcEw6kmJjWQqQvOz9hywSsLS54FFYhobpBDvvquyVhyY7b6uo5IvVk3AiDm/mVGbGWW
         iu6x8eIpGT2Ejbb+i+fB48RrE2OoqPKwRCGmF2UvCZf3O6Buu/5U11ZUWS7N9jK4TEwq
         tL+XzDge4J6PKM+mLytVnRMYlxs1KU9vTn7oCX/1MUWgN6jIQON9BZaGfcNtssAj5/ro
         JD+da9WyCdGRGn+3porA/k6owS0BIciWUIa8nXm/M6To056/cymF36wTdgEKyrJZ7aiG
         2wrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6jY8Bm57PdMrEBGTCUfy3aWn/dJhwjcA5/8Jwip2py1+9JN0fT4TCFbEJBeDUkOuR7oAaek1nobaxcpI=@vger.kernel.org
X-Gm-Message-State: AFuF++mKD9ObCey7mT0Q2D9D9pcmnLtwkfvv5w+6LVfbjHkSkc5vOQLN
	7SIQTZv2gOR1ykjqqMv9AgMDsRL9iqJ9VrmE5bD1EHd3kyR99uTQnH+w
X-Gm-Gg: AYBFou3j58ldmcr28EA5jSKrXdvYcxiJFHGi0crIEGHfHxWgc+pu8o1aRAt8CB5ywl4
	Oh1ECzUGKMKcrc9EvvQTMSjTpG9HihngbDK0BqWJCXD+m3gjeI+SDsH6i7MYjIzDCniDgOo1t92
	M9zFhfAGebzV05SoALFarbkWkgiHocEG0kYUs22vOIxvrWzF7ctY7P8JrD3jpALJIhtGy5EORdf
	qpC6iipfA5mW/mlDWovloNEddfKTQ/CTgfkYwFbx/8I1eVRfj0ff4BSok8U/zNABxQRwXOmg7Ix
	77gddK4GfWXVhXUF1mFmn68ewKiLW2C0u8B0GO5putMyaR2pj1HLItY0HjVWs8AH41GFRT7g2NX
	qzFTLtsGl4U8iGI9zJVAtQXfjG189+6Vp1m30Cp1Ohez5/qPxmAGTSBRZiRoTXI4NsoUhCO+FCn
	DsrnBcBaVzrPJyLemZVGo/sZj1wVuf5XnDMpAYDMZ8zl7mMG9ztcgAnuPvf+z0KmodjAOkqaVOT
	ivvQRrn5fM7n4y933eGY+V+L6OnaGVrSGK1
X-Received: by 2002:a05:6000:4b1d:b0:481:503b:b663 with SMTP id ffacd0b85a97d-48488f1ac85mr8671422f8f.18.1788351983076;
        Wed, 02 Sep 2026 05:26:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm6635359f8f.34.2026.09.02.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:26:22 -0700 (PDT)
Date: Wed, 2 Sep 2026 13:26:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Brad
 Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>, Ritu
 Agarwal <rituagar@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <20260902132621.7444266b@pumpkin>
In-Reply-To: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
	<20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
	<f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
	<20260831123937.32255a49@pumpkin>
	<apaF1HUtJnstuUN4@kernel.org>
	<1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
	<apcPg_y-HsMki7we@kernel.org>
	<9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 13:41:54 +0200
Eli Billauer <eli.billauer@gmail.com> wrote:

> On 01/09/2026 19:46, Mike Rapoport wrote:
> >> * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
> >> it returns?  
> > It's not pageable in the sense of demand paging. Some architectures lazily
> > synchronize vmalloc page tables and this can cause page faults that will
> > take care of the page table synchronization.
> >   
> 
> Thanks for this clarification.
> 
> This sounds like a showstopper to me. Immediately after the allocation 
> of these buffers, data from the USB device can arrive at 400 MB/s. If 
> the data flow is throttled as a result of handling page faults while 
> trying to write the data to these buffers, this could lead to an 
> overflow in the USB device's own RAM buffers. This is because the USB 
> device is an FPGA, where RAM is an expensive resource.

IIUC The faults don't usually happen.
But if one cpu write the address somewhere and another cpu picks it up
immediately and access the buffer you can get a fault.
Even if they do happen they are unlikely to be worse than normal
interrupt latency.

If you are trying to receive data at very high speed I'd have thought that
you'd want the USB data written directly into you buffer list.
(Much the same way as most ethernet hardware handles rx frames.)
I realise the the usb kernel code isn't really written for that sort
of access (some of usbnet could do with it).

David 

> 
> So using vmalloc() may result in a malfunction in the data transport 
> where the __get_free_pages() would have been successful. This outweighs 
> the benefit of a somewhat higher probability of success in allocating 
> very large buffers, and surely the improved aesthetics of the kernel code.
> 
> Regards,
>     Eli

