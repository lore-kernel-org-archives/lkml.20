Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048550;
	b=2sWnZ8QNsdJSoOwAjmKQwdPS4Z9NO3tzotj7uj9Dlj1hBX7DKpSKjfre7vJZ2yUFvm5f
	 3LtAe14BNStNCMKY0KG+rZp9FrFyX8KA8FfXOoY7zgQmFSuEh1j6Jb487fv7UmzAkGqMb
	 CWWuWHLaJoDl3JsLLZejtEgE3rxoPKlRmnnx+lXiTWhL38I+TK+4LnTvNiPRZaGXQ46M3
	 7ZvJxd6ZHTWPVhvQ/KeO6L0mA3R23Z5lYfbnAeJkODe6eu3ogjMm2NBVP/iuiBgojN4pz
	 kTyk9m9HHDUaC/0nEvvHrXpWW/88qU3MFaDYg97p3RqvF+go+epc211IFNMp22VRIwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
	b=PeuGy9b2lM9YQfEYIHzSRwc+1r8r7at/Dp6JnrHxfPdbVc0CbfFPrAGAoDWQR8dUox61
	 uJA36ajUHWVBSWTLowRdgcKszwmPsfP70S920NV1tBTZpTaTLDQ5p160NXRAdRQ3ZKHej
	 IGiJHrVSaKyCCF3hIkCqmKaIka/jUOUTrD2h63SmIkWRLjSbp4XrbYvb6xUbTUHV4wSE1
	 MN18fF+ayMS0ewcNKFsfRdckW5CI2V+l0b0kngscBJ5LoSLxO8GyH8QDkRPmLoPWD7LFH
	 SkXAZU42qqooDUJY9sc5gjSYmqycqj2zDn2KhbYX019OESouxpiYFwV1iGmsfnlwg6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxewqWBw;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxewqWBw
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a121bb8c2so45352eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048550; x=1793653350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
        b=VxewqWBwssajqE1K/421twDEM50Ya0fxQ2dAzdBlnKNWbwpj7J17CO4utV9RQPeDXl
         G1jSBc7MExVNmLM+hg3feEcOLCYA9JlvbD6GAvfloZ514VUyF3uDEM8TCQ11nuDCtk/U
         wcBiWvOy+kvdWunLmDcJBV4+E6dByLruzRSFyUNHBbqtJt/CmVZMvaiOAjkS9D3EduMd
         OXWXRPP2slF02OW98RJIoDQ4QsyYeb8S2RlsXTdfaJzkts73/5gmTaZ8AITeuAj1IuSO
         q0e1WyHqg0eNbPrT4XlAE9VRgCzt9CfononI4rbBfisAPukqf/g/rJVbu2EIanaY7eH/
         mDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048550; x=1793653350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
        b=F8gM7ZaPVUv6gGNr0ENYunMYQuCH/9j9VQHBLoYj4KsOsdtMWSRJe7BE2AYreOUkcO
         buMEiGj09YPBOQ9m2HcU+4EJXIE6EXG3VKSaNOSOtv1uBVf3mcRlIilAuVQNfSHVMZnt
         FXvs1McyO1JBKCHPMCu5TdCc9iOrnPy+h02Vkg5xbtMpxouuGR3LfhzEpvEoK/dhMjX6
         m+Uk2RTfDkseT1eDaqGfzHXsgsa3x/iuaqqHw7I/HRfH9PE4XQDf/ghpQh4ARmM2JZzh
         azOC852VMJau/IXAIeSTnyzOJy+/u4ZKcpHEg3fiFJNX0ep4nQs76UqSwYYeqWqrNcmy
         654w==
X-Forwarded-Encrypted: i=1; AKwUvBy/jTczuD/OCrFIpi1yjlbsV9uHrNeN/ovlKujbeqcUtk0Ckgo5fW1wANKF/baqXuD6S+BWM0An15o7wHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/dbeCa3Lfqh95DLmy7ngTLbJZKn3Lkob8scAzQLZLQdaVWCzl
	a6U342EVKiFTwY4XvFtaoxtqoWLJXvCyLfHTOH5WqNQ1si01eC3Hk11r
X-Gm-Gg: AYBFou0+oJoLtemHRJJPV+6BsZHxLT5L/VTPuaLQN2o3s61ZSBp1+GK7I/CH6DwSreL
	9cHBeWBVqZ521lRRL/mRxngdIvQw51cerX5XRWjVSxQCJDSL09IEN3YAEeHla7FVYpBBxp38RoY
	RUyRNrLMCDtgeNxT0sbHI5MVogpgFirZxpB7rXAE3DzjpRH4iKbVo3FR2s/qIhmu2HgjaR6u46q
	Afj1/bQHFuVkAMHBsZUUUBkf783DBFLffS2GX7KjIwtY7quDyON5u3TqzIdQxtqI8BaDu0R7b/O
	GvbY+s6H+TZcxb97cNXbJHfZLHdKYaWwZkwhT6lFdOBVqLYffSYogJSAYIgLe+9U+cDbm48Eci0
	STTO+eXp+yrk5E4fc7bKjryC6fWN1ZWlSOuK72Z7i/YsUBdlnaROHfV91iPEP955+pkhRlDTz6d
	f+d989ieR8LAmIM92z0DYlGATJrGoltSDpy7bX9+NpCT/Q64MRNj+8mqsuGeaRh6pc/qei9ZcNz
	XR58+Ha43VRt8wRsYf7qCPDtpAXzW5Cb+4gE4C8rBL5LFygTl2q0MePUOFbwHFc0X3vobxgqYaT
	gglO5g+k8q1mh28=
X-Received: by 2002:a05:7301:618c:20b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36a0f52f51cmr959274eec.6.1793048549375;
        Mon, 26 Oct 2026 14:02:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm29394389eec.27.2026.10.26.14.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:02:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 14:02:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (starfive-pwm-fan) Add PWM fan driver for
 StarFive JHB100
Message-ID: <ddf7f5b4-9166-443b-9105-807f77307bb7@roeck-us.net>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-3-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261008071950.4772-3-changhuang.liang@starfivetech.com>

On Thu, Oct 08, 2026 at 12:19:50AM -0700, Changhuang Liang wrote:
> Add PWM fan controller driver for StarFive JHB100 SoC.
> 
> Fan speed is controlled through up to 8 PWM channels supplied by an
> external PWM controller and exposed as pwm[1-8], and one PWM channel can
> drive up to two fans. The tachometer block supports 16 independent
> inputs and reports fan speed in RPM through the hwmon sysfs interface,
> along with stall and low-speed alarms.
> 
> For this controller, the special clock and reset operation sequence is:
>   probe: clk_prepare_enable() then reset_control_deassert()
>   remove: clk_disable_unprepare() then reset_control_assert()
> 
> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Applied.

Thanks,
Guenter
