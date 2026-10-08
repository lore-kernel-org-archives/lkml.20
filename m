Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455618787A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468968; cv=none; b=CEkCqWARoEKA7+Cnq7mE6om++r0KASorn+jdYmWMFBxeDcB/LgDstURbk0/n8nGwe77ENH0dWCZH6/iMMDbcm5pRqq6XgElkEd10Y6WB2TmHItgHyShqjx2/6aBrd+bxxT0A/OJG4xr7D2VdZOTMAKeEnEe6gQzOAc8VO1KiWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468968; c=relaxed/simple;
	bh=+t31azwcCJHg+PTdel+R4blWILgZCTTuWf8AH++/aVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlBdCTxiD+H/Bqf9HkA8r2XW+hnOnKSAdrjTgreI8cSrFN0kw8Cbl/htKLZ1LItyjyXzzjRk22+VVArhiNqJuZevhTExc5oIbAmUGKADq+sLUqIvnaI5bc6CkHL4/siis3qvcnD7Y9p/UQcE9+05orZQg7Pmv7NREhXgn6VGDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=myGPmTC3; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="myGPmTC3"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917ad52d7b6so54045536d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791468966; x=1792073766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3W505++mGs3YgmeV426L8BBID4lmqouAVUZbbYJa+Y=;
        b=myGPmTC3ygLdQ3LrYWuEy208LjDEklIFdgGEbtLQQOJ6H2QIpeLei+Q2hat92s9+QI
         Iuh/0vTpd/T82LgeNjiYuuSLaNuccrkoQ4lh5NiwiYF2LFfsvaAY9Y0Owp8etbCyMJCN
         CZBPONjJIfHoIwSu+bpsmdysBPD5Xd90c9XE6feu5nFAtzK5BIkldLdwsIi7dRrKvgbX
         uI6fYL6Qmo7Dyfxq+JylRnKKTS9yxvtPJQ0LLlX1Gln63cZfMW0A7H34CtWKihKM/kdp
         itVfAlG7FMn2G/p+0D/lV/9GzML3pgvz7PJEhi4hpZ6vZNLLjwpO1juCw1oMwmalCQ/8
         0dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468966; x=1792073766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D3W505++mGs3YgmeV426L8BBID4lmqouAVUZbbYJa+Y=;
        b=v+sxYojvFFDiJzRt4BSzrGg9jPiklhLni8Hwpp4HpAMmSN+vrdc9qXe/F5tcHSLtdN
         MwZv1NO5jbKzkjUXRtZm+jnFH59abbF7QxiDIGG+v8wK4B7K6GumlYwBKxFOi+R+ySls
         e8V2x1rYo/mEYUyd1TUACAqkSevZPlSgV3nNkB5ATLYt56m7V7i8aIbJ3UtgaVPJXB7x
         jS/naR9/nJsNW3x1gfKCOBZB0mbROxgFoPLChzUtwdh5yYqjTNekrAd7ukMVofpj83iW
         V/KDAGYEl1ptFe6n/tLMqvG1hpgOCoLmDH3gFH/1Yg/7xgMp9jNPOdvVQ9RZFtbe2gbY
         QR9A==
X-Forwarded-Encrypted: i=1; AKwUvBz8JZNLT742G6KKqsUu9GtTq9ZoA8icyVXgIXk53MQzQ4mtul705rAYTivUImEvwzx9rfM5Bim1SU+nFP0=@vger.kernel.org
X-Gm-Message-State: AFuF++k/1+WT5L1YJOLIuC8Gxu+T/S/lkhRABFJ+rOC229QzzVS2ZTLr
	qPuv9qAOQJ33n62Adz4oaiVlfrKPw3w0BcJXLSchEOED7Om3V4Te9G0twZRKlwLLVQ==
X-Gm-Gg: AYBFou0UauBDfT0qrK82ns9Y8SX70uIHYTjsPN9xwT2cbHa2drAMdTbGLlS5I2mHH+d
	z8RSW8XxchNKBCGV4jeaeogKbQMADX1/GuMZ0dHF1rffnp1e8rsshC+lh3kqnagpcvgHLg/OZ0W
	rSG+s194+zyUDvZ/Ejl7IsiXsGaAQusmiEOp27++OfdOatOggEBzDbMYseeT0rS4NJBfligqNAT
	JoSg742Y+Uf1IEP0QEIiNkdgtHjmW7UisSd2VmP+VEwxheSlx4smXOcfGkt8pzLSQJ2WvUdrSIk
	czpO/1EUAWo915Wr5bFaea/6PRYDVQWZUBL7Y1FXqrggfaJC0iHNoBWBKASR9SPV5hFJUj+Q6rH
	bfIub1VP+wft3BrQxecIvdfb+6zSvzisWBHIIhPMrdyJK5jHfEIKGKaYFaakfQywHoukkX4LB7O
	WWUkPtwACjpuRC7y2UjFUSNI7L20nUbb5/ltT69VOzc9lleuVvUA4wIJ/7P+CNqny1vlqfn5rFN
	L18kd72TAs4znHX
X-Received: by 2002:a05:6214:2408:b0:919:952e:95f7 with SMTP id 6a1803df08f44-919978b8a53mr106709096d6.51.1791468965565;
        Thu, 08 Oct 2026 07:16:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996cb5517sm48391886d6.15.2026.10.08.07.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:16:04 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:16:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: Re: [PATCH net v6] usbnet: fix smp_processor_id() use in preemptible
 context
Message-ID: <7c4a2f1c-f16d-479b-a11f-cef962d5e2c7@rowland.harvard.edu>
References: <20261004215937.302247-1-omermetekaya0@gmail.com>
 <20261007200049.079aeb75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007200049.079aeb75@kernel.org>

On Wed, Oct 07, 2026 at 08:00:49PM -0700, Jakub Kicinski wrote:
> On Mon,  5 Oct 2026 00:59:25 +0300 Ömer Mete Kaya wrote:
> > tx_complete() calls this_cpu_ptr() before disabling preemption, which
> > triggers a BUG when running with CONFIG_DEBUG_PREEMPT:
> > 
> >   BUG: using smp_processor_id() in preemptible code in tx_complete
> > 
> > Fix by using get_cpu_ptr()/put_cpu_ptr() which disable preemption and
> > return the per-CPU pointer atomically. The usbnet_skb_return() hunk
> > is a hardening change: that path runs in softirq context so no warning
> > fires there, but the same fix is applied for consistency.
> 
> This looks odd, how did we miss this for 8 years.
> 
> Greg is probably busy, but would be good to get a confirmation
> from either him or some other USB expert that the callbacks
> can indeed be called in process context.

They can be called in BH context with interrupts enabled.  Is that close 
enough?

Alan Stern
