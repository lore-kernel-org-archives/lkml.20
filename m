Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651693;
	b=nWgfdVFWl2yIEcCdpDLRqq6NFin3KTmsUtSc9A8E9WuYbBTLdpAOeQOLsxY+5NR5P9PB
	 5PZZakbhRDF8Sn4leKx+aAWtXGeBFtQszepEFs6L77oKsLQ0ieoS3IL6DMXFj8uwN3Z/v
	 YXo/o11TLg7E3RjNVMZEUknyGwNZeoSn2YUiIzr1TfGKGA3Tqd5TOQzxIbTXhayAMjtFd
	 OwQvUcyVMtx8ARi58BhyS7ggJCZ31CEJwdWESmzokdb3fBK9kU7SAGEsrdFAPFNm171A+
	 1IQZIwc+oIvJ7Zc+9LPlHanzw3qwoSUO6hVzF44Vu8L1BrY+YyaIiwbVyGtbpCuX1KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yIFW7u5Qk7xxuUPgKR45tAVUFJEOPQMn/9vgAno+ziw=;
	b=z/X2y71vweamYAUlnfWjK4r/n/gptVBXwY0SedUdwfyVH1KFTrY4JOgW161sn0IyBam/
	 23RdsnYmZli9AAmg0/Sv5ljXv1/G3IQXHnYSHMFUXWPDv/HIgWnAqQqBCDx3vgXipWs8O
	 jMVmHlKuDHLrSeEYvEyvlybUU/JiQqBlBJ2mP0VIzJVkQG/IENvJwBZH+7iVPJMnLw477
	 ijgOmbk6jOPmFLNIstREqOGp36+20Ye3YfXbWhcNOKei81YF/sKZ1hyD+S/6+UV87SIeR
	 A5wpLWoNfHtF3EItv0F4Liz786OGdN5NGbF66cK1G7JoIS2v/b3yZrXy+3n3pYdseJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bXbvI4sQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F96606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F96606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bXbvI4sQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so10062805e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651687; x=1793256487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIFW7u5Qk7xxuUPgKR45tAVUFJEOPQMn/9vgAno+ziw=;
        b=bXbvI4sQsYEovcTlJPqP6AOD8PImE3DKAR6zUgna8+yHbgod7TEgn1aI9rmvseik11
         cAwq8XmtADET6EdpzXDgI6YQw+a5PPW6BbeRj3WBP+IMKv5NUxVAdONqzpE1dqk5XMHI
         DM4Tc2YihSM0d2lt/Jz3T+VTWWRpPl9q5iTf/KNutB9sgQwi3O6yakELlT/wpW7stClH
         JjhxTAN2e7kGUtuiuIA2+NdVbJu6eUaERQ5znLvMwB7dxKd8WcJG4TlkoQd0WX41E1oI
         n1uFPBeC4go3XTOYbJ4OJ0A/DR36Y3/i9iL8XofNCEQDn/ByOfTFmluEe7uOEz3kskZk
         DnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651687; x=1793256487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIFW7u5Qk7xxuUPgKR45tAVUFJEOPQMn/9vgAno+ziw=;
        b=iiFDN4vMJhRC3blxGjFMTXhDnrS3LF+8Ls7vyX9cDDC4p2Wd2cA4PMATLIAA6kq0X3
         lguDUvfk4ZNq8zFidygPafaeJ/4AFXaekERYL3rFXIPhSB4vbMKYZ3evqj32fk5UhysK
         1EmsIvVkeir6wYDcvKgxTeiXMiDtVKlxIasLcCZ7EIlsRuUuaYAadkNx57m/Uta+GCeb
         UrAm5eL+siI+2xNv1Bzr8fHjlq4FdCZXuLiTqTYimkoJzvB+XapGllFKj7yvJOD36i7q
         c5QAVnOaax1O7WaBDc7yGnGsvgwdV3HboD0vnyIuEow1X+Z5B826IZomBSpRExrQ/df4
         ft/A==
X-Forwarded-Encrypted: i=1; AKwUvByhON1b8Ug9Pvh70o8mP/UsLlRor0t6E9Nt2kSYKsFpQJTKWkZNitWX91KBOY1wkm39rml4SJZFHHOeVzs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKigfMiSUbBvHFoEEm2NFQq0Ed9ELZ4hf0/x+OFUG/T/o/WT3cc
	wJAQML0ETL/+fmQbHlpT16D1PiTE+A845P7LjfTCU604bDCPcK7eOCDg
X-Gm-Gg: AYBFou3XOWTHprA1jc2gaXQiZ0fijEWlDQvlx91qGnyN7v7+ObyX89sQuBh2eTSFcQ+
	kkAnhra2PFrcEiX+rwWIJt496jFXmno9OLe7ChcOE06JGqoctdHvb5StLHBtfKW62+JEN28Hrk6
	HH1njm5Wgd+jHnLJkoojEO9P9xs6swFQjPp7d1gzzC/DWUwxHk8g+Umg/LuUF7WVOnTjR5//0oo
	iknD3V2WyMq964/2nxGsc9xdIwnt4/cCTQWzwnOQxagPXo9LekseuMw3cV19CHOB3f/+CJsv8wr
	sdm73U+W6u478jDITnzLTQnrWl+OpZt6vYAZpl9uGowHSEajFBQF3ul64s2aG1HE7BiUlQdXPi0
	DZKbjz3+NHh/W5r4xgtoqsb/5TcDIRX02lWdpqOw+ERN/R8DOyZvWVNQtOzVKl4XS18aAjqNmtz
	Vb4l65Gi3zVnIcC/hGgb+ZYmwQC/1OWUFYj5Pw+JtHTL+XU9xHEcQZDNdgkzCH/M9M9SqES7oZQ
	lCLUI/hGpZ3mFdUjPHHIkUu6w5K/ReeuwrQqEFkpTrAg3hc7ISa
X-Received: by 2002:a05:600c:6995:b0:4a1:fb0d:3878 with SMTP id 5b1f17b1804b1-4a1fdd3d619mr80013245e9.22.1792651686627;
        Wed, 21 Oct 2026 23:48:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a207b29276sm44521885e9.6.2026.10.21.23.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:48:06 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:48:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Akshat Rawat <akshatrawat095@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit()
Message-ID: <atmxoeUJ5onEYKbO@stanley.mountain>
References: <20261022064535.13466-1-akshatrawat095@gmail.com>
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
In-Reply-To: <20261022064535.13466-1-akshatrawat095@gmail.com>

On Thu, Oct 22, 2026 at 06:45:35AM +0000, Akshat Rawat wrote:
> According to Documentation/filesystems/sysfs.rst, sysfs attribute show()
> callbacks should include a terminating newline. Add the missing newlines
> to the sysfs_emit() format strings in gb_audio_module_*_show().
> 
> Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
> ---

Assume that old warnings are false positives and do a search on lore
to figure out why.

regards,
dan carpenter

