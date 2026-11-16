Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817389;
	b=PjlPgtvgmeMdUvzTqOMJlpLgCETejcHoaYNM4zwk9oHr7JFqnTQjmrIsrsjaOe+GpLT+
	 lqOr7xUTHN93c2YHJsmReLQyKy8/i1jlsB1Y8FtB1CxZnizYQaKPVTgKLhunei/uemYIK
	 LO2WqH2441yaMtIMwEe1OZrz5f3WaK5bg4By3hwzzWDi5pgkFtAQP319vSsWfXsV6LR5h
	 omVNu/tT/l7JMQ61xmf6/lPM1+JXr6hxzfahIlwTAN7usjXjd1wW9zj+GGwjEfnLxLWsP
	 /csiDvt9o2PwtjfASKGZ1LfuMcJQJwgpM0cPi0FWmzaNbRI68bk4gA0Zv7GjI6fbklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817389;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=eRLAUvIEWrETBMDYOWYYXgV19ey9LCVHccz+7GsLjNc=;
	b=MWYJzvmUVAzwQRSgEmFppbI0+rX3vX6Gv98aWSFyCiFgm+QL1mrOpnCmONFnFxQsXNXk
	 ob2vtGcQrc7wEbpQF/e41j5JoaTy8UXO3wS6Pamp4j5e23e++TRqdzVvMei1rdPdWNee0
	 e3TqTwXxOq3+Mad3/bbbdP00fSwIHyFygujWWrQXQC089eWraHLHsn4fF0vI0xcIK+Pix
	 bF/ivXTFlJpHiAaFSNtrjyQe8y+/2NqZkGHYdu+q444fhtDun51LJ9mjjDDk9i9xT/opb
	 CDXEaNMVJQCtcW0DbjqRaoWMrZKsbW22pD8O7ggTJDJDDbovyblRIxanDMKsHS4k/Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GeQZcQ4l;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3271E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3271E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GeQZcQ4l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794817388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRLAUvIEWrETBMDYOWYYXgV19ey9LCVHccz+7GsLjNc=;
	b=GeQZcQ4lpGzyNdQQh0+8yTcWsBqO/RCFchG2yC8Syip++C+2x9wkdLGcyyFCM5Gd3v7SqO
	MXt/Iwm7xtEh66PRqKpGWtsyV48cMa4+aQI8JQ3tLko8vpNnEWdoLsJbal87JCQabUBO3W
	fLysc0+fat9DpXcwG3x6kJNYHZFld9Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-8PejBK4ZNU6mTRnG3rbrgw-1; Mon,
 16 Nov 2026 03:23:04 -0500
X-MC-Unique: 8PejBK4ZNU6mTRnG3rbrgw-1
X-Mimecast-MFC-AGG-ID: 8PejBK4ZNU6mTRnG3rbrgw_1794817382
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9DBCF180054C;
	Mon, 16 Nov 2026 08:23:01 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B0241955E7D;
	Mon, 16 Nov 2026 08:22:54 +0000 (UTC)
Message-ID: <d4b5ad98-7c50-4705-96ba-604c720b794f@redhat.com>
Date: Mon, 16 Nov 2026 09:22:53 +0100
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
Subject: Re: [PATCH net-next v2 8/9] ice: dpll: update locking comments
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
 <20261111164021.273409-9-ivecera@redhat.com>
Content-Language: en-US
In-Reply-To: <20261111164021.273409-9-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Sashiko reviewed v2 only on its dashboard [1], with a low severity
finding, so I am answering it here.

[1] 
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111164021.273409-1-ivecera%40redhat.com

 > Is "use three different clock_ids" always true on E825?
[...]
 > The conclusion that only @lock serializes everything still holds, since
 > fewer domains only add serialization. Could the text say "up to three
 > different clock_ids" or "may use different clock_ids" instead?

Right, it is up to three. Only the PF that owns the source timer has the
TSPLL DPLL, and without a valid permanent MAC the TXC DPLL uses
pf->dplls.clock_id as well. The conclusion holds, as you say. I will
change it to "can use different clock_ids" in a respin or a follow-up.

Thanks,
Ivan

