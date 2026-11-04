Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778447;
	b=djYJSKxtWawV98lbYf3ruyyHVmozSJR2Qx+guKYas1Ok3S4W3cG15QpyizM4Wa/tw/W0
	 n4DXWyfTm5ktNefWbmn8ATqs5RG+s5ACikP+0CpI7zb+LJhSkHOMBkU/FTSBkvxmGf3zY
	 jl5fWttQPxbDyFTLHIE7LaHn00OsyCt1dzMxM0DI2Kq9Kvs7Riy8CtZuEl/7RotB3G1PN
	 adNjhj/gD8TMbwpU7Emxe2vfQT9xP+FRAcHcJGg2xXMMMYNAq7501gGObDuPbRpwIFpm4
	 uP61vVZB2LnkTF07AH+qOezrnFJAw4FqgzPTLQTHdFcpWE2NQa0oR6UtfiBr3i7DT1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CJrVpzWSqXnZyMhmYQZlXezsPnpuAEBGvhZcWkwrTMY=;
	b=gKkNEny4zCwyl7FvKxQBvaj/jqpomRlmjauSuwgv6+cdjo4xY8EDyHBM+ka7rfqARN/n
	 t4mS/iUW8eRpFKK4APzgB+b2xN5wINEVkRRKi7qJCBygjwIZnMC5KhwgwySeUOUvqOs6y
	 FVCJGARDptBBTv5fTIobmmJGwr2nZZGpiBblCp5Mn2tif7k2aAhJiQ4jF4Va64BY8Hymd
	 tmY+jiXAPi+pGVBhjgO3TaHQ1+DOFv+oJP0T3zCTva2gPc4UxG5Qd8/zBo2nhEqpIm47G
	 Mu+OCFf+9yM3zvryHwySKhGKOnjPz9d9qInNMgsZq8QcQPqvaUHAjBKjnkZTj76k3qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YC3ClFBe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B402606D806
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B402606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YC3ClFBe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2075825e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778445; x=1794383245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CJrVpzWSqXnZyMhmYQZlXezsPnpuAEBGvhZcWkwrTMY=;
        b=YC3ClFBeP8skWuz8WHMGy4e7IPunuP4E0neJAvsPYxuk4p92X+lLQY15aWNDLCC/ed
         Yd05k3cVKi0y7MNyJr+vJNGFp5y1OXdKiwhBoxqU4l12tyRWU/cNUXNvU0YmCV1Rao+E
         R+k4MfdfUuS+Oe64aJ0CmWjLG2kb8pDh3gJlBhwy/+GUjqq1V9Bq2+3RFZIiSy+9qvQi
         l7DjP6lhWdNbCEXdliwIygX7LgkNRrIzIh0GyRLQNtISfIe1hoH510M3WfVnv/eA97m1
         YacxX8PN3wzv0irjFLl7iRqy3baQVHxNhT/rkjp94DCkd3S4noUFh8Cl/mSZbt1RZOEb
         w8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778445; x=1794383245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJrVpzWSqXnZyMhmYQZlXezsPnpuAEBGvhZcWkwrTMY=;
        b=JkBdb2g9cZDM62b29I2YyDvB+xfRiV3okO98XY4MILJ12f6Ow2JGspGTloBq55V74h
         KolL/nwBRUGpV94kQPb5+AsLdHeTXU45UQejahkE/Dh+bvZxj0HpZYqb5ouDlAjt3JRJ
         lDrKifaXEXiRARK+BoKCXFnCjQcFtP4uETWh+f/vtHD2yZuGEKwEfQbI2rRYblw/ZwGD
         IbstpuIYlJVaFLTOjJNkiB63iW8MFXG1Aw5UC4n5aSqqAi43cOYim7RVCsZwTzrTJo8y
         MJukPkpE5dVZo/0Rncd3bxrp449eowzTuN5Ky5c31sVWSABez6m8vGLkXO/cfm3XLTmq
         kaZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEpj5FfotqOqjIgBegS126y/H/GeXLcjjIjGg8k2SDsH2kd/Tmdz7i2oUjg6YsZwG9ATiidVwV92xYZgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//+KDk0INeQHdjkJ6Qe92thrbkAAR+iGl1KrS7mui+MkpOwwUx
	4/vVyDbpXTZMzjMV3qhw7uZGjTqLXzjG40DIeWvcRM7s/SAjX58LdIqx
X-Gm-Gg: AYBFou1SqYRwKgK8a1Dlk1YIXGPl4QDzDUFGJ3tYR0bRrZ+QH1n6V7xyL6Cq5CBQpZq
	trfA8flpVsRuYRL1/17Aa4wTG4bH6GrIiptrHjdAAENCYSf2zJWQAyjDHqlS8JTNUR5xyd/xGR1
	py7nMEyRYjm4/xCyUSXet18x5ypS8o4Zw/Gw+ePuFyquNSIKm0KHficMugrudLZ2sCzX+atWDx5
	OGDN1IW7HKYZdbOpssC1TxeyBqEQOsiX3CrELAYkawGK2Xcqi+W5LNhgxcudAt6y5/5eeTX/w7I
	Qn0aDmuDN26x8NOyHAj4DrbJtF0QkJMB7gRoEQ38tvUruL5vZik0/ha7Bp159i/Mb6bKGZrb8sW
	FYVgQMIuA/12Smu7brmTHxaIxkFv1DQpNeNR+iTRRCkXQal206pVOZ4nR880huceDe0chgCM/g+
	dpaDaexHHPXhWF2ZWrVyhw2X7hHbgfYhkcWn+3UhsXWmMKe0xNxv1DS7hrl9Q8NdHjHmxv7EVVm
	faHaTRJ/hT/XQkS2w7I8PSZZZTk9gwowxeA7Ua4YXG+7TRTzIfHY+nzXv/4OGu3OzzF09k62oTn
	IozV+1J1DeLOP55SG66FxKjVxfvC4bjdF5/Y/L4//5ipbTrPbtqisVFzcGePGajPT1p37MC8BSF
	RvYFGMmRbMIV6BbOt5MAgBwg/7sRK67DnRKo6s8PAfeF5VywFoCqzlHBAwZO5xnfgszkZEzNzgq
	fWt0mnHtn0G98=
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr345570805e9.17.1793778444927;
        Tue, 03 Nov 2026 23:47:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm164324185e9.13.2026.11.03.23.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:47:22 -0800 (PST)
Date: Wed, 4 Nov 2026 10:47:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, nuno.sa@analog.com,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, gregkh@linuxfoundation.org,
	linux@analog.com, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: addac: adt7316: return 0 in
 _adt7316_store_enabled
Message-ID: <aurjB1B5sRHC6GsW@stanley.mountain>
References: <20261104041237.7978-1-mariasheikh812@gmail.com>
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
In-Reply-To: <20261104041237.7978-1-mariasheikh812@gmail.com>

On Wed, Nov 04, 2026 at 09:10:45AM +0500, Maria Sheikh wrote:
> _adt7316_store_enabled() writes the config register and returns -EIO if
> the write fails. When execution reaches the final "return ret;", the
> write has succeeded, so ret is always 0. Return 0 directly to make the
> success path obvious.
> 
> Found with cppcheck (identicalConditionAfterEarlyExit). All callers
> either check for a negative return value or pass it through, so
> behavior does not change.
> 
> Compile-tested with W=1. The disassembly of adt7316.o is identical
> before and after this change.
> 
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
> ---

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

