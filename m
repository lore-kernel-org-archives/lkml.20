Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817427;
	b=FVoHUaU2nH4WX4YgJC4L6TkqvjKGGeOOgEQK0iGwFIj5EJII1JOyUQijyajigD/pwvmt
	 lf24pqhJxogPYDdCz7ivMByCeE5fbvK3Jhbz2zfT+n5VF1rW6KqyoPLoPGw/n70eGm2yh
	 W1yLZ/QIIe1MfboXr7+btNe6aPUW7y1HlqQcCQh4olemDIDd9l7oayGRutZ4DZ92+dza/
	 ApDJvuZqStsqm3XJ7jHg71Mish2ND0Cz+MLaZIU3otj44++MYSy9vIJN0Lh9HJZzWxDkC
	 kNq5JdBoLS7+Bznx+spLBYU2Y/m+FwNqRlshITib4uSy+VCMK3wCzQnzgNKsEtPiV5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817427;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=zk7qMeGwsrGuf2gsO4HA2YvZx++EbTxoa+GvBuzPEW8=;
	b=x1A1gS4MWdykexDG13R9dc+sQDX6LexIk9EDAdXbg3Gglk6dRt9ZWdktq4KXJTkiuQ3E
	 +1USIeGtMnCou1iy5EtjGTbhLddm2VaTh4fFg7VNCpULJ5wGQ7tMuSC4eQPMoIMTqwLR7
	 1aD/xXZEUjEgjfzJEYMELDxlcxmfDttVGT8GugavlIWNi29F2J6brqFtURaa1DdEJ93m2
	 G5drA0ajsMQykfu7hHLXwoKsSSPisy1AbxJsKTvaC51+0fxzjALJnWOY5DHIhxQMU7rYl
	 JV9er0q8TLCiqhdqG+Pqjjp2EWeeQXbuMSbZTN+kY0+wH3z+R3cUEtyLGoxf/HSJtdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkcFewS9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE9B606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE9B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkcFewS9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794817425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk7qMeGwsrGuf2gsO4HA2YvZx++EbTxoa+GvBuzPEW8=;
	b=QkcFewS9ullkYehd7joROddpjZb7nZ03RFYcTwy1KiWEuvRFqeMpKEksQNz7zgHRTfcOXw
	8EJQp4QftUTkKfyhDfLzKf9LsbecJfHZkRU4V9cjYHDQ6OoHJthnPklLCPSfnT+waAYsY3
	WY3ctA3qBm1FW95Z8+56AhUOzrQNnj0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-KBcw-E4wPoCsNlIGF5y5VQ-1; Mon,
 16 Nov 2026 03:23:32 -0500
X-MC-Unique: KBcw-E4wPoCsNlIGF5y5VQ-1
X-Mimecast-MFC-AGG-ID: KBcw-E4wPoCsNlIGF5y5VQ_1794817409
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 433F619560AD;
	Mon, 16 Nov 2026 08:23:29 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E718218004FC;
	Mon, 16 Nov 2026 08:23:22 +0000 (UTC)
Message-ID: <b6e9a07d-ed95-49c3-a797-0dc23dcedd43@redhat.com>
Date: Mon, 16 Nov 2026 09:23:21 +0100
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
Subject: Re: [PATCH net-next v2 9/9] dpll: document locking rules
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Petr Oros <poros@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261111164021.273409-10-ivecera@redhat.com>
Content-Language: en-US
In-Reply-To: <20261111164021.273409-10-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Sashiko reviewed v2 only on its dashboard [1], with low severity
findings, so I am answering them here.

[1] 
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111164021.273409-1-ivecera%40redhat.com

 > Is this rule broad enough? Several other exported functions in
 > drivers/dpll/dpll_core.c also take dpll_lock for write, and most of them
 > do not change the topology:
[...]
 > Would it make sense to say that these contexts must not call any exported
 > dpll function that takes dpll_lock (everything except the __ prefixed
 > notifiers), or to list these functions?

Yes. Every exported dpll function except the __ prefixed notifiers and
the netdev pin helpers takes dpll_lock, and rules 1 and 3 should cover
all of them. This is not new: on main, a callback calling
fwnode_dpll_pin_find() deadlocks on the dpll_lock mutex the same way. I
will widen both rules in a follow-up, or in v3 if one is needed.

 > Should this section also describe the context of in-kernel notifier
 > callbacks registered with register_dpll_notifier()? The rules only cover
 > ops callbacks and driver code.
[...]
 > Today ice_dpll_pin_notify() handles this correctly. It only allocates the
 > work and queues it:
[...]
 > The dpll calls are then made from ice_dpll_pin_notify_work(). Could this
 > requirement be stated in the new rules as well?

Yes. Notifier callbacks run under dpll_lock, and with this series also
under the domain lock of the notified object, which can belong to
another driver. They have to follow the rules of a callback, and a
driver must not hold a lock they take while calling a function that
takes dpll_lock. I will add both to the same follow-up.

Thanks,
Ivan

