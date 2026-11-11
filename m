Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370527;
	b=jf3So5K3RfKI/or8n3+/oX0C4zNVeCc8eZYqKgFAqgGsb0tLamUzUWuQo9AB8sNc3/J5
	 FPxHIpkkVuNmMI4cAELD1kFI0IFCQ6oEQNLQ1wkH3DwQZXzMzaP0YPVaTbcWHJI5zCrnU
	 VC8MsjrO8Qc4ZtDFqg1VgQFb4uuxEc9jpszidV7HwDGGgU+PNDZcJDPO3WoRBiJKSiOgt
	 XFL4nNWaccNzq7Mt/umrzoQEBi7w3WWN7kUC9sH7foNkd/EA54cMG81GwcznDxjOi4pO4
	 K536ySyP1qJnqo+BueiBI89vgeTPOGptdxKu5CmHa+7s6EIFVVKQaHexUzouIaczm2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zqiKMWOLSQyjwMbkXK+aSiPK2rl2ZK7WmqO7AOWRX9M=;
	b=Yh1sDIr5QFeKMBW6KrXEAZTS27eUe8juDnSJ9U0K241JT5fIXPJiNU2CFWRz3M1yTtHA
	 WB6Lv0jJmlviD3+NkO5H1AaR10KCLoRZJ93AxEQxW6v/h6nh0RwU0O8CPdtaOYxA5U2+E
	 NLnsK7k80+QzGgiWfNS89rTKCK3mmV5p51iqOta2kSpCi98Y3JI9i6EEbRgRXurGtLM4V
	 9En+xoomT4f2sXcC+16WQi1y51KlQFCzTtP3LScDPN9QaBa4Wbfv0gbbzBnW/Wh3sqijg
	 Tj550hBP8+eqNLKcBlAcK5eGFXXC747p0mn+vCZGasOQYgZViz+31jrhy74btxSMbyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iwOmAI6q;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA4E606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA4E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iwOmAI6q
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e95bd1c14cso25106905ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794370526; x=1794975326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zqiKMWOLSQyjwMbkXK+aSiPK2rl2ZK7WmqO7AOWRX9M=;
        b=iwOmAI6qEsa+sbCiAKpgglOhpqxUc/bPKHY7KDyvC5gnUx2Edtf/rJ6i0Jn+KAyaFb
         6TmSIlBNTmJw89M+oJo4OL9cUVcNJ+LkGkvojDY3CNxcINw9xtpgYDVoZQgQNPKUaKqF
         igYl8MvRn3ugVA+lKlZwV6Aasiyb3nsgJhyyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370526; x=1794975326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqiKMWOLSQyjwMbkXK+aSiPK2rl2ZK7WmqO7AOWRX9M=;
        b=Gf0dXj6J/8kshwTjrRU3/5odPcBPZ1MWnYSF20sP/8jQscxwnJv924gzya4dkd8PZy
         zSA5JszF4IA/WMrhWZmxN5KZC+qUeKYcAGeRvOZ2eVYbXNDX0LUOxYXoxF93wo6GuziR
         gw74TA8hlivb5jyDykCKuan4dvR83yUFHaC9X2qg+/K1CHB3hIhBpuxp0NRyUH4MSiaa
         z+tKKDMK7wv2ZhHhSjOMa/gxkbcJrsFjSZg2Ydq841iyoHPv1xN1KZNzSagpstlBk64K
         zwd8uNCgLa06ePRvoKVFEM/u/6OBOz8RJTzDkHMYd3ZYo7xx1V4BsglU9YR20CGBcrww
         L5sA==
X-Forwarded-Encrypted: i=1; AL+hErHFkyIzcEk1FggOjZKoQ7S9F5OAswXkXSSTVTjQ1dbMoLQhYiK+f4+gZLLOGYaPG2dO292PG12JjPFZZ0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+48KQMejmgNd67WAuNKneWPbPc6VyrrLsAjTAcapX3Od1bknTk
	ynRilo1YqsJXgBtLguaImtj0a52zMI8fcn943SxzGAB7lzQLwbhDvrc8ySoHLWCt2g==
X-Gm-Gg: AYBFou0WX/s0/3hnu+I/NylzEivEwDgGFbwcKsknUMLsFyywTEwl7ydzr/kbqpOLlfx
	/7g3pgH9T67ODHIwP4ZZe0rn8/oPMskmFXDfUR8hV5JathwInd5zyBaz5B46M4zI8wTv9Cj3owR
	bZDQk+Z4/g/TIs+g4CBpYFwtuXrhYbsI39Hw+vgkeK5kkyaTTWaToiZleZOn3Mvhz6+omj/wIdt
	hHAmPCnzNCDd8sx9bO7OXvn0njGGOdDQYW+KBUIC96UNFuRixk1vzR229PdV6LGTfkcpuae9ZL8
	paZZ3Rq07lEeHboeWSgj5Q7DrBpxac14uWAnAGpYpCmCXS94DlEC+vYqceV5qMG6/fpB3TCD7yD
	xgvXEPe73SW0ZF/hohhmupTusRMCqeZP3L/kIGHQIY5rA0sWPgbVaQSUWkTQEvDYG3TbaBOdL/+
	jZ4GJwzy10YleyEu5ofGktbDFzkmkWEfMQAILP76m2b2CPtmnzZKOWTBHJFmUjtxHEp7Re1DjEy
	ZfXR+HG53EWh6URY8+S1b0jlYqsXjKICS5PgHGVp9P8qV2svPhNgO2F9pGAFHRmTcEg9dTFtP7R
	oMSscHAGSiYiw0x2xL/ItrznID7rHhkSLad0OUpREuek05oMfQN3kWC8AvNlxXP1ufpmzQ==
X-Received: by 2002:a17:903:94b:b0:2dd:ad74:ac1d with SMTP id d9443c01a7336-2edd79bf870mr15709035ad.24.1794370525821;
        Tue, 10 Nov 2026 20:15:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bf46sm16294355ad.31.2026.11.10.20.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:15:25 -0800 (PST)
Date: Wed, 11 Nov 2026 13:15:20 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2 04/11] zsmalloc: switch handle type to struct zs_handle
Message-ID: <avPrwgD8lrQQLBlG@google.com>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
 <20261110054836.1515030-5-senozhatsky@chromium.org>
 <avNHoaIU-RV8_fEG@google.com>
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
In-Reply-To: <avNHoaIU-RV8_fEG@google.com>

On (26/11/10 16:35), Yosry Ahmed wrote:
> On Tue, Nov 10, 2026 at 02:48:09PM +0900, Sergey Senozhatsky wrote:
> [..]
> > diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> > index dab71f582103..3a6a7253fd01 100644
> > --- a/mm/zsmalloc.c
> > +++ b/mm/zsmalloc.c
> > @@ -264,6 +264,10 @@ struct link_free {
> >  	};
> >  };
> >  
> > +struct zs_handle {
> > +	unsigned long __private obj;
> > +};
> 
> nit: Update the definition of ZS_HANDLE_SIZE to sizeof(zs_handle)?

Ack.
