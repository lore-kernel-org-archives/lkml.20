Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825829;
	b=2hzXibzEhk8wPDR83ZtzLlrtP2A60KQClj24eeUQj5eMEcQ8grkMIhY4/ngVIeat4usk
	 QZtePYdy9FLkce0kAGW3aqXt743MqNhsTk4yaczLr7K/EaLJ+g8wOLoH72aIL91zrDdDY
	 S9QhP+rwePPGwp6rWWPb4EFTfItfQZpa5KIUafq2Uu8aTlCCZm5X50yqDtmOysRAReu35
	 eNBAOwDEDLRBBhYavSgOOP9LQ2a070yEdHNSTYf4ooDSOTxwX0RjPlNUJ7EixjfUE35s0
	 2hbimtc4L2QPiZGMiX5s/evKMf7KF/tMx5JAxEGY0OqaJK2ikl9+Ju/fU4sZYKnEaiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825829;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
	b=yPwzYVXOiBA8OGg97/8kx9Tejo6HpKUyxUMrqOWvHGSexgv7vmII1N/RxtFvJooKB/sc
	 0eRLVQYpBEdVEBmme7GxKhCsXlbwKtrDtKddZOgwgT2KKtseZQS1xCW+5chrZn84bnMH2
	 5n4JmBVWYZphLg+l6emaltDxjaxSdmP6KzDIA2+ERrItQHFlMby5KdlJkM/Y6GazE/pnR
	 mAcqR2mQqytPZo7wxDspA5lT2U8EfkoTdMjVDWzk4fTE2FbYrheC3Fe2aqA+mjq5HBbHM
	 rMQBQjzKK5w0jXSXR8mkZIqgtvIP+McKdSXhGQs1kIrwi5E/bbGwpNPL3NuG5xwDUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JpQXbB51;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="XSX/+KDj";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A7609C05E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60A7609C05E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JpQXbB51;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XSX/+KDj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793825828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
	b=JpQXbB51eC4YbxGNr9rbAouwt3QYNfrCjZ/I/rBkSNiPGjHTFm3CUkzLCkVs8B4SAI3TW/
	zS50odUCKCLHEmB+ula1gQyqX0QWOnbNt9NAuNCUpODBvYO04vEt59E4b6dyFznJBVwxeJ
	w28ISCMVVJ3IB5HVk1GTTBL8ZrvTgF8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-mrvcl3O2NyKXmOsNkUw7aw-1; Wed, 04 Nov 2026 15:57:04 -0500
X-MC-Unique: mrvcl3O2NyKXmOsNkUw7aw-1
X-Mimecast-MFC-AGG-ID: mrvcl3O2NyKXmOsNkUw7aw_1793825823
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so13277745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793825823; x=1794430623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
        b=XSX/+KDj/myjMKCt2zt9+q5XUkJPNGNbEYPReBac0xi4QN/9krLLkG6WmCr8vG4ul/
         j8HcJRcZkfGP20Y7nxlFEbUQAOpkfzwDNYvkrtjkzdmvcnwPb0i3NCmRN55yE3CPUdqX
         OGvpn9ShgiEuPmfOc7nXiV+YpnVZrmdv04IqqlrU0s4Wxlk3ruUtvCNKgeN0nHZQ94P9
         VIRjdf+2CEheb/ypMc+13Qawscq/kgtL/dwI1Us72aC0BlIgKin+KlFy7T7wi0quhNLW
         zEaL28CtRdFvROdLKe3w+M0JHWUJ5JohBgl23zl92CQOT2xlqm1gtQBnFGUuOi2AYtHd
         IwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825823; x=1794430623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6s4TTDFhNuhrsnjNiQdR7CRo6Dzt3ANt515Ib4703k=;
        b=fouzwZqCXVIkJCDRlMOhOLIdAI6ieC3Y68AkaTXeuew6k6fntABMW077fZma8yXxXA
         qVgiluCf+zOXo+qgoIrWCIa2NYLHE0u/SiYsV4SwHeZqPDeFiYaXKxJrq+nxsiz1TM7d
         mXRHPV5fkTf0xlLv6qjTOUuBbSSTuaAxMOCLvjr6jotnfFpau4cKUVClVxBzHjtSPxwe
         vVwlzWJCHeTQxeuwAo8Cn4d95bC5igr1Cc2xlcYcrucvTsAAwAOjdMtYfwczW27IfPIo
         ufSGJOV5HCmlaYsyq4w6cyOmb1zr0IvKH7lH2hWWDrvTjQInLIVrJNTrnLg3oaYLwHJn
         PBTw==
X-Forwarded-Encrypted: i=1; AKwUvBz6HLCD/oFa0V7hopvxNoeRqjdhIMdtA2r/eG6mJ+/aLtG7bbfk4H/wNpufFJILt6fm04r+wB/qMJsfW+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gH8lBfBXjrH9ovoNMwbht+Ocu4CLN/ibo85d4rh0YnpM/8Emj
	Kqxr7yQmklAXGFBReqSZCxRpK7O3DMyyOLT+RFDvQuufX7r+8+ZSBWcrTOFERzSUlACYTIVK8JJ
	yAHM4d9JwVX7XWlbACWhrT66/I2+ke2iX7PPqf/dd/RRu6Z+JKy+uvc0vBrrRe66ipA==
X-Gm-Gg: AYBFou0SZuYEWkvlvv1xZnLrxj9Ul8HJA0XbVor/cg+SkanQ5Io3yeQZW6OXZY7nAJE
	vSFuIdD9WqD0ZEncS7/4JWLCob5xeLx46g97/Cg1BtbJbgkBvPTrXCblXdWvD8mLciHR4iZ4hDx
	i5ShlhJ+gNa5eK0uJpMzjVWUnShIFKsqN5Q6I080dmZpKbTqGUMyfIDUUgJTdqRjpWXJ92VgyFr
	Vc2wgasEsdGkV7mQ8LTC0jjigV6GVTffgN9vqmPuZWYac+1IcrEcx7JMIXxDp9IZYj0qZ5FSsQf
	CX816DANdhOnIyIrSKwc+9uv5JV0YA2UZ92Fk8aYTLo+A9y1R6Pd3/AnkvJTSqCVj88i6HemvgF
	dJfpwrxpvjWbMS6ejEgcdn/3TDbGL7w0wa/PgMlSBbNwgvQGek9hhcpqZ6oKe//DzK05+TdEfPB
	P2v1Gmj0leDOMGAPDMc9dk6CB+jzdseH21+JiF+3nocCw=
X-Received: by 2002:a05:600c:8b55:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4ac17ffb30fmr374653965e9.5.1793825823532;
        Wed, 04 Nov 2026 12:57:03 -0800 (PST)
X-Received: by 2002:a05:600c:8b55:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4ac17ffb30fmr374653795e9.5.1793825823110;
        Wed, 04 Nov 2026 12:57:03 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56b78d656sm12312525e9.0.2026.11.04.12.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:57:01 -0800 (PST)
Message-ID: <c9ef3133-856f-4554-8c7f-0f49d364c617@redhat.com>
Date: Wed, 4 Nov 2026 21:57:00 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: usb: cdc_ncm: reject short
 GET_NTB_PARAMETERS responses
To: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>, netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, oliver@neukum.org
References: <20261102001114.38144-1-xinsheng.zhu.ny@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102001114.38144-1-xinsheng.zhu.ny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 01:11, Xinsheng Zhu wrote:
> usbnet_read_cmd() returns the actual transfer length, but cdc_ncm_init()
> only checks for negative errors when reading the NTB parameters. A short
> response therefore leaves the missing bytes zero-filled, and
> initialization continues with parameters that were not supplied by the
> device.
> 
> CDC NCM 1.1, section 7.2.1, Table 7-3 defines a 28-byte NTB parameter
> structure. The pre-errata structure also contains 28 bytes: NCM 1.0
> Errata 1, Issue K.
> 
> Require GET_NTB_PARAMETERS to return the complete structure before
> continuing initialization. Return -EIO for short responses, including
> zero-length responses, and preserve negative errors from
> usbnet_read_cmd().
> 
> The issue is theoretical and was found by manual inspection of
> usbnet_read_cmd() callers with LLM assistance.
> 
> Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
Sashiko noted on v2 that this may cause regression:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261011035150.53315-1-xinsheng.zhu.ny@gmail.com

Since thei issue is theoretical I think we are better off without
this change.

/P

