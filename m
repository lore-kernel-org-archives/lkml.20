Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817497;
	b=k9SjE5tNEY4C2HYzw7TJB2Na829KFR+OqDPrT0ynevjp6H1aJLE9BdTOGCSGVjoaEghU
	 CfUflkKZYBBH6x98menAMUf8l1ImiC8uLUMVLpUNMtsBj0SziaSeaSYD2VKZ180YqjLTY
	 xZnkxyBniIWGZ7nCJ4G7/EdF0MsUVf28kl5DoPjgCuUmovL0aFkaBhjAF2AB69CmUHoGq
	 NXZIEBjcpnUn4KCxhEjxujhxA8G4yneiOw6TcE/naA4bEZw5y0iIIkt5+bI00HSajGa4+
	 VFqNOoV090Bdr85pSO1aI45drfe4zZ9reHI6f2GgPg2B/4v7jgMPwUjizc3Uxpar8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817497;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=0JNXirIXq/TDKZ0NaZ1yStkjBc16eXaBQqcskBQBeTI=;
	b=iHCTFbnMXbYrFU6XUBGLWw3BOYuhMOD0IVmZblEXWc18kBQd6mQOIbnAzA7ZfRQTU9Qk
	 JYxZnIV3wa50DCP8h0xHQpZiePflDnn4QI2JLvvYKQVrnMlcH1Rnz+9aZxVWi8siPla0N
	 FkRoBxfMcTmeYlsXXSZWLubIlr27GbJ+b5QeOwzQ795C3bgrU5Fd/cJ+v2eQK3qH5mKhL
	 e+faKuDzWsT1QX58ONIFMLuHwJ9cMWU70A58i5q2Fb1fFcKCkS/6t/c+V19gF1RgC2NV+
	 /68I/2Zoc95jhKvahtEAN8JX7+zPR9S/u+tY26A89JE18KbGO1C23/enbwSQGpxcNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AMdX0E67;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB1E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AMdX0E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794817495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JNXirIXq/TDKZ0NaZ1yStkjBc16eXaBQqcskBQBeTI=;
	b=AMdX0E67mbyXDs0c3FMP2MPG1o3KhhTVzEs0d7f1bqKzDT2zkIn8TtKpxRkzBUS5ub7O8i
	YLyaAdZqpVYtNTcVn4gdZkM2mJ/MDlqiV2FRJPPZ/v02eqdfDk8RPX2R5Os1w3dkVufY2P
	vaBpBEjz0MlgRH8uCWLKUbjToBLMQXA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-onXJjqY7Mi-8IUXNEOKGMQ-1; Mon,
 16 Nov 2026 03:24:50 -0500
X-MC-Unique: onXJjqY7Mi-8IUXNEOKGMQ-1
X-Mimecast-MFC-AGG-ID: onXJjqY7Mi-8IUXNEOKGMQ_1794817487
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E25F119560B6;
	Mon, 16 Nov 2026 08:24:46 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DDB01410;
	Mon, 16 Nov 2026 08:24:40 +0000 (UTC)
Message-ID: <de304923-783b-4533-8507-514a15b3556e@redhat.com>
Date: Mon, 16 Nov 2026 09:24:39 +0100
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
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
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
Content-Language: en-US
In-Reply-To: <20261111164021.273409-1-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Hi Jakub/Paolo,

v2 no longer applies to net-next since net was merged in. It conflicts
with 7a3837929d04 ("dpll: notify about a reference sync pair only if it
was added") in dpll_pin_ref_sync_pair_add(). Patches 3 and 4 fail on
the same lines and the rest applies cleanly. After patch 4 the
resolution is:

	down_write(&dpll_lock);
	ret = xa_insert(&pin->ref_sync_pins, ref_sync_pin->id,
			ref_sync_pin, GFP_KERNEL);
	if (!ret) {
		mutex_lock(&pin->domain->lock);
		__dpll_pin_change_ntf(pin);
		mutex_unlock(&pin->domain->lock);
	}
	up_write(&dpll_lock);

Patch 3 is the same, with mutex_lock() and mutex_unlock() of dpll_lock.
KUnit passes on the result. The SyncE CGU fix that the series needs [1]
is in net-next as well.

Sashiko found only low severity issues, I answered them in the replies
to patches 4, 8 and 9. Would you resolve the conflict when applying and
take the fixes of those issues as a follow-up, or do you prefer a v3
rebased on net-next with them fixed?

Thanks,
Ivan

[1] https://lore.kernel.org/netdev/20261110094350.184185-1-ivecera@redhat.com/

