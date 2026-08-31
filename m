Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37E2D1913
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206087; cv=none; b=oEwd//ubj3pUl4Bj3pWbZKNociru+HGDd+mXhUG4il/cJIp/q82DfXsNVZHu6JHXDg5CwqeXfTcolqvC+MXq1r5kTN7urswzUjsYsvoiAp77j3TpUE3Y3ZovK9xkP6fjJOwbbo4k5AVEc9Zzsl6DPPkjrqRzDQQCGzFhDwtVb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206087; c=relaxed/simple;
	bh=15a0LTGeYo8zOBmJgo/ZnXR18G1ReDCB7rXXZZCKKl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyD4QQs6Mctj+uM1wLMh6HT8Bxkx2VxiFoq+2pAEk8xlqCcJ+TFxtA2fGjRXWkDuq5YDpkVVKYdV5vhCzDgscv5IOohdrNt8uOZ350bN24efvsCumUmA463vNOfXYwSYz+FZ20Thv2OagCUql5Gi0KiUz/w/F0+M4UeSoi2qxZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5mdG8+/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5mdG8+/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso254626a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788206085; x=1788810885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qskMQe4LjjXVBmevlEbg5fLbtpZ04tZedzGfc/8LuW0=;
        b=b5mdG8+/v3oM6Xkq6J7oJifckucns9gZJtWFI6tXignqoauDA+DcBWQ0QgWMYSwXEQ
         cWKHd463q8yEIlmdhSUTtO1VHeAY3JsZeGR6kyxnOKQmNjQ0jT839h0eN/YL0UU0TUxW
         gTwYFKybf0Q1crr11KG7SPWptMuo82CLXUN6NP4jLzuhunaaUUIJSiQpBjLlDfEN+4ew
         GNAERpJ1ngrKgr5PCb/XTbjmv1e2u6RSy43m/DXoNNT9obNVF/UeZSXdLXgfasB6VA0/
         q1s4lAISNZqYOba0GH7abpGZhbvKv1i1plU0/+psKP1ceHSKXlYsnIGmyfBx3dMVymqh
         4PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206085; x=1788810885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qskMQe4LjjXVBmevlEbg5fLbtpZ04tZedzGfc/8LuW0=;
        b=PbxOI50vlnm//o29JH046tTps2yBNE9UUiFmJ42AG896/pVgyAEvgLCkRn8ulv++9I
         MI1sir6A53BTqr2BesHhFZwrwv641K7lDzke1cV4mXch7P3LVapBOBEuqtEIM1pr4c6D
         EyVXIek1ZgdsGuap9Ud3C9nsggrSN/cvkoFJdT/Xru/P51II6xtikay3PGgVLiMqzskx
         FxzvZ0Hc8IZ9nWSE4wuEDpS0TRB/y/3G1oKU0Gm7QmAl9KUKHbE2JGAdE/qxc6baO+Kw
         eO2im0yMcofsO087EpYCpWFD7RNC//4gIodu4SBNii9tx7R+RSEi+mXy6g25hAxhGszi
         UHRg==
X-Forwarded-Encrypted: i=1; AKwUvBzhNXJe5b8YHkl72RcQnxeBaEiJ7i39wnqQ71WC07/jSmT55bpsG1Wv9c88GrmN2j8cpVAly21t2yzsU5U=@vger.kernel.org
X-Gm-Message-State: AFuF++mZlmQ6K15x4OPeJey9XNvDMt0VA+SjlmCDBuovLtvlcyHXz4xd
	CXpcAT3CPSV1vYyEHOeOPuxR5ZP40RMt8x5Z1CTS2/Y2pl7PXpx9Cvrg
X-Gm-Gg: AYBFou0SXoD0hgYwGcg4D6pz3JQGuv3CasF2kQaEmYm8796xDJRqr7s9IlojbCjZEA5
	1TNmbm6Qr7GegPePegI/8yM1AWYFaRQMTiWhn6iZmx5bUUZgSwI0mbxxekbRrsz8UXdwuijf22h
	e6NhLb/0Duy0cYT5JUmLGFDz/0y5iP/5nv6GbJNvV0EuXOzEfkfu9zDyqlRbSiAZ4ZKtDaNf30B
	GGVSlNDPnE/Tem0KoWX+R3tbXmImhrfLhH5Pko0d1akrG2Zb7oUNEGUtMtx7KwlRYgh5BsfFbni
	UdyIl1eyL8jB2dMh/Enz32y07FySnQM1+MqdTQYnELwtlVjjcifIY4GIGRR4BjA8D04Zdi9enFz
	O/rKwBmYJYaLUdkVfBSkfMoLPoeZCHFUbvvkeXXwWYJs3qWxssf9wio9JkNRzr8vGwHQgVBoNCw
	d8r404sqzKKJLeflfiqnkVOs95vkLWa8Yla8nQKynVjicS7l+dy4OPJbLDJgMNhHdQ7HQi/NRLF
	PyHWR961L5i
X-Received: by 2002:a17:90b:39ae:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-398deeda0cbmr13260559a91.5.1788206085513;
        Mon, 31 Aug 2026 12:54:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d40ac7sm29241613c88.7.2026.08.31.12.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:54:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 12:54:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Asai Neko <sugar@sne.moe>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING
 WIFI
Message-ID: <ef7a4a5d-33b7-4e9f-87f2-2bc1111ca4bf@roeck-us.net>
References: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>

On Tue, Sep 01, 2026 at 12:18:24AM +0800, Asai Neko wrote:
> From: Asai Neko <sugar@sne.moe>
> 
> The ROG STRIX X670E-A GAMING WIFI is missing from the driver's DMI
> table. Consequently, the board lookup fails with -ENODEV,
> asus_ec_sensors does not load, and no asusec hwmon device or EC
> temperature readings are available.
> 
> The board uses the same EC sensors, access mutex, and AMD 600-series
> register layout as the ROG STRIX X670E-E GAMING WIFI. Add its DMI entry
> using the existing X670E-E board information and document the board as
> supported.
> 
> Before the change, there was no asusec device under /sys/class/hwmon and
> there were no EC readings. After the change, the driver registered four
> sensors with representative readings of 57-61 C for CPU, 68-71 C for
> CPU package, 43-44 C for motherboard, and 49-52 C for VRM.
> 
> The readings correlated with nct6775 and k10temp. Repeated polling with
> both hwmon drivers loaded produced no EC access, bank-switch, concurrent
> access, or locking errors.
> 
> Tested on an ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
> 
> Signed-off-by: Asai Neko <sugar@sne.moe>
> Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
