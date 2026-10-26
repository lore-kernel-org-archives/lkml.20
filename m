Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022244;
	b=rwX06OBH4GfVZHtOEhPu2bOBE6N8YMJpG9eHZ/LmskNFBUln/1t0vHLXmVR6UPtDK1h1
	 XqF8EthGdZgTc8pPcKEO4q4lU7T/7iGaBhiJPKxbJ0Em7Mrs3dDLKBbc6452R1XJozmE+
	 2ztgovRQ8fpvM2h2e5iTJ+UDTTm1XOCeS6WYyX73JyoJTs2riqPh6ajzu/Nvyviey1FXS
	 0gfO4iHClq024A/H3y4fFPj01nUPXO5Eum3Q5Cv2fof4NiBfiSt08y8UfeIEBB4C/xNND
	 KxR6sUz9oxIMLD1gkfiieba/rh4GV+UXGIPMPJO+d9KUZFrGGRgT9YoiyE/xyYFaZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022244;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1jtJReYRyqdsrFZjdueNFI4v0PWkzXe673TTWmiTniM=;
	b=VGm1rbBzqkzDBGaW7IbsmK04wW7xhWXCmO9m4aFbec8R85jIDuP0fZk2Wqa3o7kIkb5m
	 cOTcTPcSjAM7sGo/oMOhVXBfQ2XMYvyaKVrzx8dmFv81LZFG3TP/iVe+UjcUj13wFuO81
	 Orw7iuHtuzEOGVbRBMQdT/TUVEF1NmEypTcL+uPUvA68QnGMVpkp5088c5AqmMbo0mHNW
	 77yDsYRqNaWmJmtNlQI+TbMcB4+vEKmyejHGKGJDyMAKJDdCm5yE8oFfrTtpRdHAlpf5X
	 ngpyOI0d4aS3Ece+vysYidnxIQPL0354LdlQ+Ww9at1i7cAfLBej8CG2I1X1PFPscsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGxUL2p5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HZ8AIFkK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A01606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A01606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGxUL2p5;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HZ8AIFkK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793022242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1jtJReYRyqdsrFZjdueNFI4v0PWkzXe673TTWmiTniM=;
	b=AGxUL2p5Tf14DdjsUgDCtHbN3S+mLzeLujQN0uZhRiwFo8fN1xg+zTXE5rcPWqEKM3cBoj
	+N8ouZma6oLlTfjO2+L7VBByh3pbBN8pDaGkG7zn09W3Pp8ECHr751vbrBeO6i1A/GIylu
	3mDt2L2N86XzH5RIDGhjoQqwe68dv90=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-MV3YP6-YMlSZiiZgwmdVNA-1; Mon, 26 Oct 2026 09:44:01 -0400
X-MC-Unique: MV3YP6-YMlSZiiZgwmdVNA-1
X-Mimecast-MFC-AGG-ID: MV3YP6-YMlSZiiZgwmdVNA_1793022240
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so23142615e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793022240; x=1793627040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1jtJReYRyqdsrFZjdueNFI4v0PWkzXe673TTWmiTniM=;
        b=HZ8AIFkKm+vVLVgO9EdmXUoZD5Mda3mLYMq5uhwzinCo9CYNI9q4wnXg2nRsT8RBWk
         uZengEhiPz0wherT8RlAEGBk+L0TH8C0zWdh/FZPoLrcFakhSzNtluC/eiT+5dSFPM+g
         3fUo509UZeAjkT+4YGAxJdqeJahOrHxjHQ3UiXFQIURkW4Y2etPEiZGTxgqtXhbwHscI
         YEBL9/9AvKB12JEmcbe6ooh1AJKP5f4PjNR34CSZ+MtOLFP+DK7MgCZFiEfHbhXDx0rx
         vL+x1m2T+cp4n8YIYim5kMXT9JrEO0BwGl2WCARbmR/HriBIzbMwMaCNHekRAp0rJsAf
         HfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022240; x=1793627040;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jtJReYRyqdsrFZjdueNFI4v0PWkzXe673TTWmiTniM=;
        b=xGbEmukertvqekgH9zqpqIuOkYHac86A9MBGQCviFhvi7YZWYYV2Jx17U6RQX++Hn0
         N6IDPI/aHWy1SiqRv+NkxIjuMQGSJ8KNuI220zxrF3mVRo6Kb6AMEaxD7ME9cGmZd2kK
         JAussYOpTTGj9aZXJFUEKDzUP71l63cWGoGpT/L+u7br2bkNGwJMzhZenUDL4GTWFaq+
         MXaZEVzt+gKIZmao9y32yJTYp05REbDF6icTkd5VNcS7jwzCgkH4k3jEZLx6JGtvEEFF
         k70Tx5V0OKHK7l+nHXz/KG/MdjhLSW9OUKDBhEs6hQLuaQYwbzeUaaz5iTvvNJsnaQwo
         9GiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx37uo06fKYKyTxj1q/p2+1GuYfxLA9ZKBVHEKpYHY4Inm+Y516Vs2yaDXJx5YOXRH6XupW/y9tz+xigd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI52ROZSb32ZDPw2WC+0oIR0g6RHByHoFZ63mUEX7GAHanwYj9G
	utFXz3hcvw8pqCp9TM/hN1qXq5UkvpJLNjV9mUKRdEAQm2LAekPD+XcN4OdD4xXUfADjnQE7Wc8
	QxtACmpBe1vniFG/XVjlPZ9vdV957lYpFgZUTfcnjYBxzwk3Fntwsmqipq7Tbb0JCjg==
X-Gm-Gg: AYBFou3sQO/LY/RLXZG3nSQAMc+/eiEv0pQr+RMbSGvvQquMhvoCjx7yRXvA3xlNZH/
	c6BqIBYJD9j4SO9hnCwKCf8NmpLwZaNNPt0TRolP4qCm7KMSoAXo/PBEGXwujE/PvWP0WFxB6YW
	W3KaB5n2Qi2KJrVoZVW5m7RcHupvvoJwnV9KeblnJwCiTYzKkCeJ023kV2JgMPyG9NydGf1rAnW
	KtSUzDI5/mjn+8n52u6+jFUMa4VafZZZSvKrh+POWPSwK4QEbMatDbGKt+TjwL2Sm2P/HrMS+CD
	ckViPy4+OymGdi3VsotTruUEa2Jmrc9N8X1rb9+SSIJpWAg966Dlu+u1RB8/hAmiY6o=
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr115422145e9.10.1793022239654;
        Mon, 26 Oct 2026 06:43:59 -0700 (PDT)
X-Received: by 2002:a05:600c:840e:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a35acafc84mr115421575e9.10.1793022239010;
        Mon, 26 Oct 2026 06:43:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm245511405e9.4.2026.10.26.06.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:43:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:43:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: David Hildenbrand <david@kernel.org>, Breno Leitao <leitao@debian.org>,
	Atish Patra <atishp@meta.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH] virtio_balloon: batch large descriptor chains for page
 reporting
Message-ID: <20261026093445-mutt-send-email-mst@kernel.org>
References: <20261025200808-mutt-send-email-mst@kernel.org>
 <20261026125911.753798-1-hruben@meta.com>
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
In-Reply-To: <20261026125911.753798-1-hruben@meta.com>

On Mon, Oct 26, 2026 at 05:59:11AM -0700, Ruben Hakobyan wrote:
> Sorry, I just realised the other reply went on to the wrong thread, so just
> reposting it here.
> 
> On Mon, Oct 26, 2026 at 12:19 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Sun, Oct 25, 2026 at 04:56:41PM -0700, Ruben Hakobyan wrote:
> > > On Fri, Oct 23, 2026 at 11:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > Great patch, thanks!
> > > >
> > > > On Fri, Oct 23, 2026 at 01:19:19AM -0700, Ruben Hakobyan wrote:
> > > > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > > > to the VMM so it may discard unused pages.
> > > ...
> > > >
> > > > It's not just a question of convenient, is it?
> > > > Rust is buggy wrt to spec as it allows only U32_MAX.
> > > > So it is also to make it work.
> > > > So should we maybe fix Rust to be spec compliant and allow 2^32 too?
> > > >
> > > > I think we should definitely recommend U32_MAX in the spec
> > > > because otherwise it can not fit in the used length.
> > > >
> > >
> > > Thanks for the review!
> > >
> > > Sounds good to me, I will CC virtio-comment@lists.linux.dev as
> > > per your recommendation.
> > >
> > > Agreed that Rust-VMM should also be fixed in case 2^32 needs to
> > > stay the hard limit. I think here for the driver, we can be more
> > > conservative as long as we stay below 2^32.
> > >
> > > ...
> > >
> > > > > ---
> > > > > The wording in the spec is a bit ambiguous because it uses "chain
> > > > > length" for both descriptor counts and the total size of the memory
> > > > > ranges referenced by the descriptors. My read is that the byte limit
> > > > > applies to the sum of descriptor lengths, which is also what rust-vmm
> > > > > checks.
> > > >
> > > >
> > > > quote what you are referring to please, also in the commit log
> > > > not after ---.
> > >
> > > I will update with quotes in v2, thanks.
> > >
> > > >
> > > > I would also CC virtio-comment@lists.linux.dev - spec should recommend
> > > > U32_MAX.
> > > >
> > > > >
> > > > > Another option I considered was to limit reporting capacity based
> > > > > on the largest possible block. E.g. for 64 KiB pages, the largest
> > > > > block is 512 MiB, so limit the reporting capacity to 7 to stay
> > > > > below 4GiB. Although simpler, I found that the time to reclaim
> > > > > was quite a bit longer.
> > > >
> > > >
> > > >
> > > > So I was going to apply this actually:
> > > >
> > > > https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/
> > > >
> > > > which makes the question completely moot.
> > > >
> > > > Does this have any effect on performance?
> > > >
> > > > Thanks!
> > >
> > > Thanks for sharing this. Yes, this would also make sure we stay below
> > > the limit. Regarding performance, I tested this on QEMU and it calls
> > > virtio_notify() after each completion.
> >
> > Who, QEMU does?
> 
> Yes QEMU, sorry for the ambiguous wording.
> 
> >
> > > Using one chain per entry
> > > creates more chains, so QEMU can use more CPU time to reclaim the same
> > > amount of memory.
> > >
> > > If we go with this, I think a QEMU patch to batch notifications
> > > could reduce the overhead. Alternatively, I think we could create
> > > larger chains here but make sure they stay within the 2^32 limit,
> > > and keeping your approach of queuing them all before kicking.
> > >
> > > I am happy to share a patch with my thinking here.
> > >
> > > ...
> >
> > Oh. It's just the driver being silly and never disabling
> > callbacks.
> >
> > pls just add virtqueue_enable_cb_delayed and this will fix it.
> >
> 
> Ah great, I tried with virtqueue_enable_cb_delayed() and yeah it
> largely fixed it.
> 
> So regarding the patch in
> https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/
> 
> I see it's in a larger series, so just wanted to check if you're
> planning to send this patch separately? Or let me know if you'd
> like me to do it. Thanks!

Yes please do send it separately. That work stalled, the mm guys said
they will have someone look into it, then never did.

Or maybe even simpler, as below. BTW we might want
virtqueue_enable_cb_last, instead of delayed will be more efficient for
event_idx.

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 799b575a3828..dc94b417b14c 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -246,22 +246,23 @@ static int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_i
 	if (nents) {
 		virtqueue_kick(vq);
 
 		/* When host has read buffer, this completes via balloon_ack */
 		for (i = 0; i < nents; i++) {
 			struct scatterlist *entry;
 			unsigned int used_len;
 
 			virtqueue_enable_cb_delayed(vq);
 			wait_event(vb->acked,
 				   (entry = virtqueue_get_buf(vq, &used_len)));
 			virtqueue_disable_cb(vq);
 			if (used_len == entry->length)
 				set_bit(entry - sg,
 					pr_dev_info->zeroed_bitmap);
 		}
 	}
 
 	return err;


-- 
MST

