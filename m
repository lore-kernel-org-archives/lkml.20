Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A706636197A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714211; cv=none; b=H2ig5RACo2wFJzItpXqKsmpFr/CttM2AGlkaarcdLlMJ4aDOUBiachfayDT47BCf/FoWE9Hqmy91fpnFjxZX1r4GhkUlyU4xF2My4lt8/jdBPPXcmIBLDGgcOUJda+kYnuRUx8tD4JLnJqKEah35MneeuTVBlUEAFYnzaucJWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714211; c=relaxed/simple;
	bh=3nQdtxw/p3KehznPyVdjNN8kTVqQcOVVInmE6Fspmvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubZQ3AtFSX8hd/R15WtnRihFNEDy9EAfbhfo2bnxcwNJSnqdiQl5EK6ACXMeD7Uw7Fx7opw8JE07GaQDl+lYkNwdWuLZZm/751P+x+jbyrdIVm/+zqmxMJug7h67eV/4RAWZ0ouK1GA2K2zt8SGrHzj0NkhmImBqnR2FR7XLjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=islALXcM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="islALXcM"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2547919a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714210; x=1789319010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WbyKgxmi/08EG4pWqu0vnWSWMfKp3Bgy++/kX1RtY/8=;
        b=islALXcMkeE19kDYnyctCkZOazjAyEgafus2D+wqdD2hFX4Cet8ObCIBUIQwTdHc7K
         frBUckQTayhunRYMV8xFGbZj3h0yFFqo3K0OIKeVMt6ikKqi4R9ZF9N0MfZC5rM7JBSz
         c4STraOypxKYcH66L6XHWhw97FWfeHG1K7aUs2+9MHPOGXZfNWM4XwAfSi+5f8JJ6o39
         FFsLRAYMX0SPz47WkTJrYmL5uN/1yntMWFaaxXo79EdEw9u7UCMEuHboT7127AG3PqmQ
         K3zmFM4xwanJgEbEZVKZ1WjNGx9+73RbCixIGeg+wUcs1DzSkQnBsam9gvNzKSHtdkPU
         xP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714210; x=1789319010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbyKgxmi/08EG4pWqu0vnWSWMfKp3Bgy++/kX1RtY/8=;
        b=RPQ0ldGvroaBnElZNxQ/iXQtZlYd4JwiSXyM5FYlHZDEn0LzpyspBNDdaAFSa6W5rV
         DnSmDUMAjbtZRkfSViTAXUFdQJsb//t2TEDFznMycbLH5mQ+xGpONXq3mGr6CjdAnXEe
         y2HsnQwSRE1mybHOI4rvYxTm7Vuj2LbAtrhqD6mXMpMPolOi+RMJEzMPVK0wAGkno2TW
         p41vlAJuqnmpmhTLnL8hTU4eay4TgalJRkHfZlZ/hlZy61RI5PhWZDqd86FW31B/bl+r
         QhuR6McUtOBUbpddz3m0r7CfxHoCz1c3WqtBDtMcnI+2CWvMsZA4Xs495fRHwHbYHvvk
         Blig==
X-Forwarded-Encrypted: i=1; AKwUvBzd/YFKJLUu02iODWqWCA2XbLq5fJ0Z6eeYXN3UJ+WBYCuejEdYWwJW/7IYzof0kPmTC4ouQqVr4Lcrzr4=@vger.kernel.org
X-Gm-Message-State: AFuF++lpPi1M/0k1dz7zEJ0jdVhv5eEwxG72Vo7S4D81LCRmHxirnGWF
	9VA3IfUb80QoocSDfOh8G9Pr0hnUUNfxj7BR8n5JCGlT6oiUNDLV4ch/
X-Gm-Gg: AYBFou2+Po2BzimW1Zc4h732Uq6WJSp9ZWdbm0ZVMW6+qPwIQPUV3WOGvwoMt4/mJcm
	a9kL+qgJUCtIIA7tHDAqdYXgBhq0pLydpIxZnM+dUW4DVPkH6YcIGJGnOgoIwUYmf/DtJt8kPxo
	FsEdB32GUj/UrvCsljNB4es7sg9NrZV9i2soGoZ0Jw6cp7ll5LDdgzMHkS9/ef8TN2obpSumyyX
	Ub4PuDdGYehizGjEipzFSm+si2W5em34TpaydTK5hcU+f592PBT5uzX0RS3qA2q5JkLQrTOJK/y
	0vxAuTNEmhi4246Y7KxqSqRyw1RfDdHnq1dj9ND2FgYkopIgC1mJyG+KcjJMcv/wCLyIGI3yPmR
	q7CX3mj+Ijb3UyNWUReFZxhGW1/mzxNJvJty3GqrZjwHM5MF8uzUCKHWFYpKGrpRALaouHzCW8i
	8FVW/2q1qywlHFWYguI0qZ4/1dS4LcZasl8xNqY8ZgaLqkw3o+hz+QxNXwpjbjfyDbJ7MYuttEj
	ag=
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr26267464a91.12.1788714209868;
        Sun, 06 Sep 2026 10:03:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae60891b2sm9330813a91.0.2026.09.06.10.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:03:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 6 Sep 2026 10:03:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Mario Nuevo <marionuevo@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z490-A GAMING
Message-ID: <ec1e36dd-3128-42e0-be0b-dcb7c7aff303@roeck-us.net>
References: <20260905080346.1957380-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905080346.1957380-1-eugene.shalygin@gmail.com>

On Sat, Sep 05, 2026 at 10:03:36AM +0200, Eugene Shalygin wrote:
> From: Mario Nuevo <marionuevo@gmail.com>
> 
> The ROG STRIX Z490-A GAMING and Z490-F GAMING are essentially the same
> board apart from the F's onboard WiFi module, which isn't wired through
> the EC, so they share the same EC sensor layout. The Z490-A exposes the
> same EC sensor set as the Z490-F (chipset, CPU, motherboard, T_Sensor
> and VRM temperatures plus CPU_OPT and VRM HS fans) at the same EC
> registers, so reuse the Z490-F board_info for it.
> 
> Signed-off-by: Mario Nuevo <marionuevo@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
