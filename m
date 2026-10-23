Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757723;
	b=YWbxL5i7YdrNNFE1vRvS5Z1A9x54fetXIJQNFQyYIG0vyL06EhTUVZsclRrN3/jZWQ3X
	 N7d48+1DXid8h/OKzHpzvHPLxlBhbhteyN2hdR17XfHOj4E07kvjH7EbFkdaipQgh3liY
	 vGONLVxy2+fxHqlczpQaZ99WlgWnHVr9LQKBg4TI0J/ZN8RjlyivLNt0+R7+pcQlQMG+q
	 eLBp/xqmEMPX89cg2x1HvALb2NolMPcauQh3Vi7AP9+NYNiM9RWayEzuXQL9h0OXb5L/a
	 7KsJXr/pQiI8qn+ME0tGNBqZFodLNr01+LfBT2BuPfnM+EJknVWeHPJ9torMLFwGipQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757723;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/O8ddyO0QswDNW9VAk+G7Y04FERK5OlichYw7LW0Zos=;
	b=xrgY2BK4aueyTIwtcWmNt9s/XvLqqfNj+fph/BCy2MItfBWNJEvqwJZdTZhJ88AA32zx
	 CoHnNXa5xduHvug0fFIs7njeM8I2wgW0ZRV/k4k/dEfGsAJeVadMci4dGesZGqFetMJ27
	 Q7eIOUg9ho3kCvjvQG9GDLFhthjPXV22mVSIw9V4woyYdFsVIaSg0an54Zu/LOeIDamra
	 Kz8b95TbqiCK/w/enFOaMrgAl5gP3QujFexX3CxvwquHUStlYuEs7pCk/R4Rv1agv/SJ/
	 q8+TRFjVJYarlWAEfoIXlzhG285AF6R0XTixDkglWdjBfM3dbr4bKRjxOqx13zSHRiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zn9i+8vQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84823606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84823606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zn9i+8vQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792757721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/O8ddyO0QswDNW9VAk+G7Y04FERK5OlichYw7LW0Zos=;
	b=Zn9i+8vQrGhhwQNPzTCsu65h34SGbY+9yzVTCMc5q0HLaOCYfBpTW/nZF8OTxmC4IYe7Ap
	YA4uByuiqrnNcIcpjYouOXI8fSLISL66BnQGJidYxrKWXzI72kbvz/W4/1WsSEBLgzt+Mq
	Cyluclp2BAuT6Esl4J1Cv0ddn2YkI9g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-Krqh3D2BMUSrNLYiQmbPFA-1; Fri, 23 Oct 2026 08:15:20 -0400
X-MC-Unique: Krqh3D2BMUSrNLYiQmbPFA-1
X-Mimecast-MFC-AGG-ID: Krqh3D2BMUSrNLYiQmbPFA_1792757720
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bb074ed1aso29176706d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757720; x=1793362520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/O8ddyO0QswDNW9VAk+G7Y04FERK5OlichYw7LW0Zos=;
        b=x6Vcik3uOHtoS0mSHzt2cdU1f4XgQRJiobylWCOJ2sFBd7TgJDsoELhvkjSokqdixX
         Owammk9csI0mlRPjOub1BFF3IySVqWk/QnZFzU5FUrYcC1AZqasN91VvuKggmzRNB8al
         qAlEYhkveAImco80w+9tqZ96xQGr55YqrDl9V/QpOl4eJkG3GrWLKlADVdIXN0ld+fWC
         DpmRBExF2A9B391+eZji2bX5HvW4Ta0grteb094HPZi9iosWAwneGtsXX+lr6DLUFMqb
         vNCb2VYhoHMOExA/WCtMb9jfLacfKEDEA3V3e6nOnC2bbNnzX89xNcYCaoTSCbAUtlXK
         iLYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFsqP+9hEVTyNjZE0wtPVeCv/1fUGR5PJ6/HU0+6Rx4qrRMLDGLrSH4nMQiDhBir1bEi5BNgogG/xt04o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt/tnRPHY7ui/IQNPlN2EnOVocb8OIo+8USYmC4U07/TE8FvQ0
	i5lu4TlHbawPNScboeFfVsMiXh1X4f/yeu8W83Ec20AueRiySjjVaJo8BmVWTDychA/zR9GuTBC
	YgoOaoLqdftTjkuIUICrIi0wVM7n1qtWUfhAZiiAW00jGSpcJhFDin5z8rWjAcqEy0A==
X-Gm-Gg: AYBFou1biRBz6TuBemua5X0fO/MA6YGDmTolfm5Jo5sCzhiSP2Y7lIJc3aYpd6cjgjB
	fTmRy5j/8+C6UgghefN5i76ciYM/Kg22Bft1neHgc5frwrYEi988FlskVzPpD19OTm7xY/tTaTw
	p3Cn0CON3Zjy7RUXxzcF5aV0Xz7x8YgsiLMQ64BtCv7tFGG5hfAs3USk8xk43wqMMj+RZd5Es/X
	KCyoKuG/PWq3/9vTRqsKwtuVA0fmr6SA/4okXDPUNL3XG2Ja37/wRuwh5MtOHU+6hWgEiiw0gkt
	D9DpBCdR6t7oS83D3m5sGm3G3N/CdSWxh82nBAr5a2OeBcRWvkx4aGrJLQOgOgyIpAjzlreARrS
	lAxE=
X-Received: by 2002:a05:6214:5702:b0:912:517b:40f6 with SMTP id 6a1803df08f44-91c3ab11b46mr27423946d6.40.1792757719490;
        Fri, 23 Oct 2026 05:15:19 -0700 (PDT)
X-Received: by 2002:a05:6214:5702:b0:912:517b:40f6 with SMTP id 6a1803df08f44-91c3ab11b46mr27423096d6.40.1792757718665;
        Fri, 23 Oct 2026 05:15:18 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c45252a59sm19956d6.23.2026.10.23.05.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:15:18 -0700 (PDT)
Message-ID: <538f7c6f-3e16-4ab9-9b79-232b34fb4d3e@redhat.com>
Date: Fri, 23 Oct 2026 08:15:17 -0400
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
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 David Hildenbrand <david@kernel.org>, Jakub Matena <matenajakub@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261023023106.515365-1-luizcap@redhat.com>
 <atsWop95CHj6oTSU@gremlin>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <atsWop95CHj6oTSU@gremlin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/23/26 4:18 AM, Lorenzo Stoakes (ARM) wrote:
> I'll look into this but obviously we won't make mixed map regions mergeable (nor
> were they ever), that's completely broken.
> 
> The most recent version of the mm code (which is going to be send to Linus soon
> in this merge window) documents why:
> 
> /**
>   * vma_flags_can_merge() - Do the specified VMA flags permit the VMA to be
>   * merged with another?
>   * @flags: The VMA flags to test.
>   * Returns: true if the flags permit merging, false otherwise.
>   */
> static inline bool vma_flags_can_merge(const vma_flags_t *flags)
> {
> 	/*
> 	 * VMA merging assumes that a VMA's flags and fields completely describe
> 	 * its state, which is only the case for mm-backed mappings.
> 	 *
> 	 * Mappings which are not mm-managed may have established state upon
> 	 * mapping not embodied in any attribute of the VMA.
> 	 *
> 	 * Additionally, private (CoW) PFN maps encode the source PFN of the
> 	 * range in vma->vm_pgoff, which may otherwise cause spurious merges.
> 	 */
> 	if (!vma_flags_is_mm_backed(flags))
> 		return false;
> 	/*
> 	 * hugetlb mappings contain per-VMA state, so their flags and fields do
> 	 * not completely describe them.
> 	 */
> 	return !vma_flags_is_hugetlb(flags);
> }
> 
> I'll dig in + get back to you.

Thanks Lorenzo, I really appreciate it.

> 
> --
> Cheers, Lorenzo

