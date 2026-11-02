Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640666;
	b=5a7OqzDItO5mrY0lUNIp9omhzLwi19QACO10CNdh66sITC5Ej1y+Hlj/vi8PhUlTu60c
	 HkWGHr6NcW9hWeYnQONcO+7AEMZN4cruQLevQPZF2LYiS8VtQI+uMeLcmf16T/aeX5Ufl
	 7UznnZEkqNFjYOl1WE8yzySJ+N9kSVi0mM1/b5nNmUNGbqEleNESbW3IW3w0LKfm0tzPF
	 HrDSXfhxxhUwIkOsQ25PtOumUdoBTkMtc5N10ZCJItsUud59wBNAgb/gWO2wg8WIX5gDL
	 lb/paN+xqhrdXBjKBlS80GrMfhSj/Z+Du01ARGpd2Za6gfB23xHjFKXunSIzAEJ5G1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640666;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1RMGM2tdquFW2b2zOYAB2Tk8dbjfkSZIp3K0bLlHl7I=;
	b=AA/7CA9Ahq2oPv86mruxE7Fj4W1YjJ91hWT2mONiYFAPEi/ds+5T4Uv48s9d8BK5A0OS
	 I/jvSjI+PgTOkv1KUlP7eDwQ+WQMWLKKcdnbp7pbCDhoTbOu95MG5GP8fCUAeA0A00/We
	 0b6Uaam8zCaY8geIqF3y3Hmzlbl3XZ1yLMcLSlLfEcTIPli9ZTSnDm8CTO2ie4KozFY+E
	 hQixGEQhkynKm/1OATfHV8g2OuRrmydaqyn5/W9fVoT675DZg20INUoATtEijGIBNOliC
	 1EgHTv5L8xs075DaZ2Kx6eSJeapvsg129hYRjZAODCwh33Rb9DJVjoq9JhyKCAt/x4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="WO/weqq/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nDV52+Pg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3270607466A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3270607466A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WO/weqq/;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nDV52+Pg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793640664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1RMGM2tdquFW2b2zOYAB2Tk8dbjfkSZIp3K0bLlHl7I=;
	b=WO/weqq/mBliiL5yMRKjE/qPlDM3IwxJfG5ikevaMuZ7pnw6yd6/1+jmTIh4GuunYICdEp
	8Eple4CV1QLH5zp1UeweuSzs5djw0Mt2uJjyWXcxt/kb/xD1gmLhtjMxM/N7wl0zKMaRtk
	q0IoPsf9XfbiqXfQKSJQCYlk6jDthRM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-DuU-0YY6Naabn1bzFGiwQg-1; Mon, 02 Nov 2026 12:31:03 -0500
X-MC-Unique: DuU-0YY6Naabn1bzFGiwQg-1
X-Mimecast-MFC-AGG-ID: DuU-0YY6Naabn1bzFGiwQg_1793640662
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a2063be13dso29504045e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793640662; x=1794245462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1RMGM2tdquFW2b2zOYAB2Tk8dbjfkSZIp3K0bLlHl7I=;
        b=nDV52+Pg5PDNA7V1QVQKM2uUoSBEq5/BhVNKgQQJ0jEhyHgyBTW3BdAc6ZdiJsVv+M
         cJ382PbjYgAWqBRtjiDYCtAqHaV7ygbLyJSEZF9f+Zt7Yu7YNASwaXvmYwbqaFFZQHzh
         Hpg/v2K5MYoGB35N66S2kl5yIFgHuQBPtmtjd9hKeP/zAas5S1Now+bywd0l1DCHZOkE
         piikiCezukkgW16O2vEVHcn23DQQbyukWIFiTiqC7pqCxMYRxcapQb97oZcHEOxEcYbY
         V0BQI/tPYp8WuoQV4+DeSpaNDaxZxczCm/BfmpiEuqSVuarNGVNmF7ePo2Ffbwdb52bl
         TV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640662; x=1794245462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RMGM2tdquFW2b2zOYAB2Tk8dbjfkSZIp3K0bLlHl7I=;
        b=kx9IfPufiaReNbuMpvgSrsFZGCxynUgRPKyIP2dg1xVRB0SySZCw8ox1tHEj2IzGwJ
         g7pR3RqTewaZVdAleQomwKkMECGj2P3rHKqQc3KaLGUn6y4AcI05IEzAE6l+wd/Z0uqZ
         u7hWvvYopVPQLWAk1igozX7rqmyoKejBAHsQLx9Mkwack5+tUt5WiniXqq4H2X/oRMqH
         dhUvmcXQN1BfA1kTim6tS0gO7Z8gmT66jBmvRWfxXyOYVpnSdhejmKrQkjpxiQpNNCvw
         VEapzPFhjzudhOJv27K+NV3yti0oHGYSCv6MmcbJ6GGH9o5IWSTCzUeAeJjtLwA//Uet
         mtNw==
X-Forwarded-Encrypted: i=1; AKwUvByRNv19fZ7mRaShBJRAYilzBwuZd2q2GUeSYaecRDx6WzsPnBP3lJVN7W51FBNByutUMkAlclhkDu9R6UI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvG1FhJd0r4l/cd4YiQkHgF/e5Bqy5ReqfRn2VP3SUsaYlzAbb
	9Q6oeuQWEmzyxIY5DefkU58SC6Y0HjM3UMNdUB3hG1NC5puxB9ZqIxCum8p53CchinIGS175E23
	a3XYJ/oQSpdz5oBi1R7UGEmdqD4wtGwLeytB7ND9WXaOXL9rB+GsiiB/DBj9lQdyLrA==
X-Gm-Gg: AYBFou13fieEq1Gg42wXEwKf6/vWgSHItXMg2U/IGE2Y/cvv10MX0A+ZnT8ockY9K88
	nCTmtlFM5SMwFXqJUafkci/hGthaKxPwJjqKS7aXZ/CUc37DTJmvb7x+9EHvlBdiGyt3SLw9uWq
	pnnfKa6XOg+TCR6FrsEWf6rKq7FR/sG3zUNFZyTxy++tQOwhoGakx3zzDcok3u5a1NDWGSbp6EG
	/mNmuSRVdt0HnSX2HC0Me//aN8o7fZFiuqHUNs+9t7544VIFWwzSAHZRlgpsgb3wK5ZXL5ElIWD
	DAPKzs5HlWMZgNqOg3bGk70NeiA0d8F3JeLXS8WEk639shdIWRkUzjbwlSFBy17X34T3+Sk0CWe
	CTPTIkVeqz9kaqhK1KqiHbOaa5gD7FvyjwCqIVUkSBw==
X-Received: by 2002:a05:600c:310e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ac1709ae70mr245615735e9.15.1793640662137;
        Mon, 02 Nov 2026 09:31:02 -0800 (PST)
X-Received: by 2002:a05:600c:310e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ac1709ae70mr245615175e9.15.1793640661652;
        Mon, 02 Nov 2026 09:31:01 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa953d35sm1240835e9.9.2026.11.02.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:31:00 -0800 (PST)
Date: Mon, 2 Nov 2026 12:30:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lianjie Wang <karin0.zst@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] virtio_net: reject stats replies for queues outside
 the request
Message-ID: <20261102123049-mutt-send-email-mst@kernel.org>
References: <20261022182710.2055771-1-karin0.zst@gmail.com>
 <096bd22b-c569-4998-a943-0381c3fa9998@redhat.com>
 <auCkXHi6IulXgm7v@wang0.localdomain>
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
In-Reply-To: <auCkXHi6IulXgm7v@wang0.localdomain>

On Tue, Oct 27, 2026 at 10:53:16PM +0900, Lianjie Wang wrote:
> On Tue, Oct 27, 2026 at 01:06:41PM +0100, Paolo Abeni wrote:
> > On 10/22/26 20:26, Lianjie Wang wrote:
> > > [...]
> > > @@ -4976,6 +4977,10 @@ static int __virtnet_get_hw_stats(struct virtnet_info *vi,
> > >   	for (p = reply; p - reply < res_size; p += le16_to_cpu(hdr->size)) {
> > >   		hdr = p;
> > >   		qid = le16_to_cpu(hdr->vq_index);
> > > +		if ((qid < first_vq || qid > last_vq) &&
> > > +		    !(enable_cvq && qid == vi->max_queue_pairs * 2))
> > > +			return -EINVAL;
> >
> > I think the above check could be simplified to:
> > 		if (qid < first_vq || qid > last_vq)
> > 			return -EINVAL;
> >
> > squashing the following in virtnet_get_hw_stats():
> >
> > -       if (enable_cvq)
> > +       if (enable_cvq) {
> >                 virtnet_make_stat_req(vi, ctx, req, vi->max_queue_pairs * 2, &j);
> > +               last_vq++;
> > +       }
> >
> > (likely with some meaningful comment).
> 
> Thanks for the review!
> 
> I looked into this, and I think last_vq + 1 matches the control vq
> only when all queue pairs are in use. The control vq index is
> max_queue_pairs * 2, while last_vq is curr_queue_pairs * 2 - 1 for
> ethtool -S. After ethtool -L lowers the queue count, or when probe caps
> curr_queue_pairs at num_online_cpus(), last_vq + 1 is the receive vq at
> index curr_queue_pairs * 2, which is not in the request. The simplified
> check would accept a record for it. Since the ethtool -S array has
> slots for only curr_queue_pairs queue pairs, with the transmit slots at
> its end, virtnet_fill_stats() would write the counters of that record
> into the transmit slots, and can write past the end of the array.
> 
> Would you like me to keep the current check or change it in some
> other way?
> 
> As for the comment, I would add the following above the check in v2:
> 
> 		/* The control vq comes after all max_queue_pairs pairs, so it
> 		 * exceeds last_vq + 1 when fewer pairs are in use.
> 		 */

didn't get v2 yet.

> 
> Thanks,
> Lianjie Wang

