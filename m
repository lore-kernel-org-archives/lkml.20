Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048247;
	b=CBSq8dgMM19C/MQvI0KTd61w9i1Vmina/XfJyB2XalQGPHYaZFnGNRD+je5t+SWVFZXh
	 8ZnmPmBLnRIdPRH8vCQR1YdSOu3kBKohJqXeCf93XleM0vrKmK0LsCGcmPHIlKGZr7u42
	 lXCXEzRffUBw2G8cWXTbAHFDQ5MHGO6l36Q2opHDnOm3GRS/sFA8ajAdmvND+HZHnarFM
	 MF4LPjHwHKss5+J5CKPOLzaBeCASNRN4uaxazhPsZgP28nwfqyb8Mx9lUsb0RmwLmsuz6
	 HaaZS8Dzjiaz4dJgk6RPwoOPxkHCNh1jPYw8A2Q3m6t4gm6+MiZUoS1l49p974xtI9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
	b=PoYcNSIrkBDwp8falnSGtYEP+JxS7IDuKjUwNke715doexZKmVVn8iUxird2oHfo9Osj
	 rJyUPnxVwQq9AMTzS2QU/h74oBq9OpW+uavZJ7LUwoAU+IGg9qxUtzIPRxibEloBJHCAM
	 xaOkVFU3p17134D/3IDH+bTXveJ+sKBD28SeLNEeCa7BhIyZtaExKBCNm6zf7vZNSqqoy
	 joO0VV+dithviCOOrUTfjAUSUGcWT7cEofCNMH5EAvUyhdHKMVenmlTsEPrhKiJhDAAIk
	 W1yeRhc6ilbR6cnuXTAWuMGhEGltrAxZRhYnECLS7+BQXkj+Su7WUPYm6aE0jYfnuow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SVKvyrXn;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAE6606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EAE6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SVKvyrXn
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5636860eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048246; x=1793653046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
        b=SVKvyrXnxaxe3wPPZZ1ORnZQD+FmJn3puBBneOzZPNYO1atUqVpzFkYCg0tlekPSbq
         oec7KSDZC2EmgC2lgU2WejVpB0D1owomNjdecD7/lAIj5RSVH9xPNz7fZcUWPdhhgcqk
         PQn4cR2OpyfjawPUs5XnarLKpLJpSsqe2j6y+MUvVNDbhocTXH47tMn0EtKJXoqHUHpq
         fqrQPAFSOLCDcF3MZ4MuoMas2Yf1nPqkcZDJFzxIxs4Jb5pedpVbtzQWyYM3Kl3QEJKe
         V9wjgLUNbTDJGYc2bUBb13eU4CKy+/VYxoR1Vy2zn5cFPEHNvcXgvkfpmLN3YR9LItaC
         w0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048246; x=1793653046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
        b=HDIGwhf+AdR0+TjO9Js9qhomENAbx9OjeWS3xxIjDPG2JiA0bcbFLmYsn/ca+qCDZG
         4vcC+8AG+2SHiNoVExIVrVF/yW1YjIMUkE5JAYgGRxQ0iTEMVTFl9KyVLL4r7b7Nz0u6
         BiYyQ2kehzKZAnxfSc4UPpsySx5FbI66ifUB8GSwjySMCNIfn4u81e30JSr0ndlHRuc/
         pPOm09fa7Ppo26ox+tk3y+gGtGQp5mJxrTSk3EvJJHdA1CxGw1LTWzj/8CQ+bsZSCJ18
         /5t/zpAoEcKbIWRYBWR1GuGQFR7JEt4I+pnjnNYSqFnWAz7EApYCs8BCh9F9KIesGzg4
         DLqg==
X-Forwarded-Encrypted: i=1; AKwUvBxiXZdh2nrJx9WTr/E6IvM17L+pHGgyaeGgJxb5pmp7UboXEhumI5Zj89HgZZeMuqOC42WpBNp0f9518qc=@vger.kernel.org
X-Gm-Message-State: AFq9FYITJbh7AXepSI2pstEWg28DpdEz1kufB3WbGmh0NVSkFwnwBLhO
	2EPc6+FJUqtanYr2RzhttfgoDNJMd2o3hz+clMVJ9tr4tJpmj+Eu8ps1
X-Gm-Gg: AYBFou1++5DbgWV0NKrfOgsmTciga1jor+ySMpn5pZNeboL9/VcbJWwrUabYmgdV6pI
	f7VeXhzezOOyXvsZsm+YYJEUaxvXw83Ftmhrk3O0QYjOSbk7J2mlqwq4atOYTVor4umBOI5L605
	lntgoSrZcoMPa6uHvJe2OFiIe2Mu4SVOvNuglRAGTch+CKrr9gpFYYjPQuQz77ZLA0hnFv9Gc4A
	5DIkWkg3ghIHHr15RayO1JcojWAny8BVOroJBZQruK65vtUlrRnzeKOvP6ymcbaqnXDQ0TrF+Lz
	Va3V7H6PKt1rPyw52DMIOnpXYyWRbXMjVyYBvKRz4M7LAFxWZ2I388VWLIXlMG4Hqc7rbVNwULK
	2gRfnM8Ta/KPrWSwGB4DuCC8PiD+s5GmFrjdoN67Bi3FKwhjQzqaUlDIhMZHZW4dxPUPviEr29Z
	sY2sp/1Zfic5QGpOYaXZLFsKD+N2kJYvd4NyDuxFVaQ8sP7Jpn1rTRWZsiGIW+1F1CqBuBelkMY
	cp5Dvt1iAFj0BSt/EE39zFhsR0nqLeo25buWFEGqMz5F4dgtwYkqSQRl7CElk2J9BEsSX4WwJyo
	FNmhJxrc08QgnBs=
X-Received: by 2002:a05:7300:7fa3:b0:36a:fec:d8b0 with SMTP id 5a478bee46e88-36a0fecda6emr1183915eec.25.1793048246156;
        Mon, 26 Oct 2026 13:57:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm10004470eec.2.2026.10.26.13.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:57:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v2 1/2] hwmon: (gpd-fan) Reset both fans to automatic on
 duo boards
Message-ID: <481ec234-15a1-45df-9e7b-9c280ddde9a3@roeck-us.net>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
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
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>

On Sat, Sep 26, 2026 at 04:11:20PM -0400, Alexei Solcanu wrote:
> From: Alexei Solcanu <alexei.solcanu@pm.me>
> 
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
> fan control tool that exits leaves it running at that speed.
> 
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
> 
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Applied.

Thanks,
Guenter
