Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678840;
	b=CL5qYzzrKUGfWME91k/PtMMqgcVTs5PcnD+5Ev1xb/+smg3O+dz99PaipqNrkAiPYAvd
	 dfBQqNVFDaCp6EKuu76SAOAdPzYcF6iM0eI2IUDaBo9RlZ4f1fNlA5lqnJFS2ooOF4T5W
	 pJ2ZK9AfUk4rVvh2xTewsvTLsOITMXgGNr0Yd41TmEphH8JY5j4FBw99JmEmi+bmEBleL
	 GkLsXYL0gmKZYc4+1JU6Ohv9JdQ7djn7ax6AOMh1JI0F3iCQYs0sfd3UAyphuUCZOv9Wf
	 P9Wg2FJM0Op7OX+8pcxpJkJC+Y11FtwCjqWQRqyrYR0lmQE30gBeGXRmtQAhKNw6+aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678840;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0yC0Wrf4nrD1HQnsTBLD2PZGSp8C8ysH6eIf+cD1dWw=;
	b=zKFv5fmwGS5leEAfU4WAg4eB98R3MRw/XE8OQyKYtbE81rHK54Bg9QBQ1QAzA32aSTle
	 WzYVNbcIXAdeMjcWYS1WkwUhngpa0jgL/3H8dSRl0knK5WyXhUyeb8GFbdsWi5wm+Fsiv
	 RDV0YyL07V7EJfCWhMKatd/KkJH28FRDet8ToDg2Gjg9KR6/bE/7siZ3IEpjEDQeAy2yW
	 T6S4+hCaWTd66WSgvb637iSmm+PHx2tzlxY+vTGvjcTt3o5V4JNki8Vz+HaioJsjIcGxa
	 oLBN0d3TNhbpEFMB6+1GcFM9yJRLKp1KGWr5MOBW7xwJb0RcYBrmupoFSmx9Tw1QfMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="Kh5YPZg/";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BD606A324;
	Tue,  3 Nov 2026 04:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090BD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kh5YPZg/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0yC0Wrf4nrD1HQnsTBLD2PZGSp8C8ysH6eIf+cD1dWw=; b=Kh5YPZg/HP65n2u4ZNHPw/o3qH
	LAivrfokQ0ZHtXUf0jmpuGO71HgJn4tOZfFRvQCGWEIOgUrSik2zKYGnmEyMgfK1qcaXmt6ONc6mu
	kqT2NRDUlEPNX8m995blWpKWHyANKHnixzL2XHRfBnNxqGb1iEyjwTxTOgeHSFXszFiEnaJyn93q4
	Mg1VBxzq6fQBx01JbCEurgEIR7PomS78SE9CsS2ZnUS2ISamV/JBRxzOMg8t/TSDiS6BTln8SZs/u
	2BWziPbfXqsdafCTDqyMQKBfhXcTwf9vFQDINCs/em2gJ/mYeo7iq4JjJ9Et0ysbTV9shiZygaOQW
	eZ9lTG1w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5nq-00000000yvd-1SUy;
	Tue, 03 Nov 2026 04:07:18 +0000
Message-ID: <caa02760-9ba8-41f9-9089-3ceca2201c13@infradead.org>
Date: Mon, 2 Nov 2026 20:07:17 -0800
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
Subject: Re: [PATCH v2] USB: ohci: ohci_pdriver.h: fix missing kernel-doc
 comments
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20261103014710.2451967-1-rdunlap@infradead.org>
 <02148858-defa-4c15-92e5-0ce7029bc000@rowland.harvard.edu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <02148858-defa-4c15-92e5-0ce7029bc000@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/2/26 7:49 PM, Alan Stern wrote:
> On Mon, Nov 02, 2026 at 05:47:10PM -0800, Randy Dunlap wrote:
>> Convert comments to kernel-doc format to avoid kernel-doc warnings:
>>
>> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
>>  not described in 'usb_ohci_pdata'
>> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
>>  not described in 'usb_ohci_pdata'
>> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
>>  not described in 'usb_ohci_pdata'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> v2: move all kernel-doc comments to before the struct instead of
>>     having them inline insidet the struct. (Alan)
>>
>> Cc: Alan Stern <stern@rowland.harvard.edu>
>> Cc: linux-usb@vger.kernel.org
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>>  include/linux/usb/ohci_pdriver.h |    8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> --- linux-next-20261102.orig/include/linux/usb/ohci_pdriver.h
>> +++ linux-next-20261102/include/linux/usb/ohci_pdriver.h
>> @@ -13,6 +13,10 @@
>>   * @big_endian_mmio:	BE registers
>>   * @no_big_frame_no:	no big endian frame_no shift
>>   * @num_ports:		number of ports
>> + * @power_on: Turn on all power and clocks
>> + * @power_off: Turn off all power and clocks
>> + * @power_suspend: Turn on only VBUS suspend power and hotplug
>> + *                 detection, turn off everything else
> 
> It would be nice if the indentation for these new entries matched the 
> indentation for the ones above (1 or 2 tabs instead of 1 space).  Aside 
> from that:
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 

Agreed. I'll send a v3.
Thanks.

> 
>>   *
>>   * These are general configuration options for the OHCI controller. All of
>>   * these options are activating more or less workarounds for some hardware.
>> @@ -23,12 +27,8 @@ struct usb_ohci_pdata {
>>  	unsigned	no_big_frame_no:1;
>>  	unsigned int	num_ports;
>>  
>> -	/* Turn on all power and clocks */
>>  	int (*power_on)(struct platform_device *pdev);
>> -	/* Turn off all power and clocks */
>>  	void (*power_off)(struct platform_device *pdev);
>> -	/* Turn on only VBUS suspend power and hotplug detection,
>> -	 * turn off everything else */
>>  	void (*power_suspend)(struct platform_device *pdev);
>>  };
>>  

-- 
~Randy

