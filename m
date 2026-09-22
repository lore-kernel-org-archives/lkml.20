Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE9455612
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092199; cv=pass; b=KpGTXPtr2mtgCVl6k2ZsKDW56rqCDXvbH3zAYQXqmFA4eXOrdnbHL/CzwvqqYs5h8tOV8gzwqsnFtYWd5PYmlDQz87nFJXEWqxfaDbmE92CS38zkX5GnQYOtO798NjBMdj0G4LKDI8ZLbuyn7if20XM7RGUrhzx4bwZVGYVuIe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092199; c=relaxed/simple;
	bh=FwvYiaDcG7fL1f29jUItXT2GNsF0KQa+Oubzhul7ezg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kemCmxaVVn3jEKJ84aRb+IWdJCtP1+CHxJYy/XcjpSdVxGveq240iZ+aP1FvZKG8kEqp9hMgG2Inbu2jzu6b+JshWlOawZ4bpx5pXGVSzmnEJnu8mqXWbHZiSxYabQhe0kIhcovXqFmmP32TR0cYSeL3qP7/WOislkMfuBErfkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=BgxwzVEb; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="BgxwzVEb"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6bd42f1c01cso2541366eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790092195; cv=none;
        d=google.com; s=arc-20260327;
        b=GN09zC0FLAmXjtW+bq/EJ52HYlDj5jGbU4O41JMyli5gIfBfZMFkIcXn7htglXWVvo
         +cPwqtFbX54khBlo5IegPEsbh+fsxL42Duifk0Wy0au5xsmCq8uP8hC0elALV1Cm0X/9
         R4fHlytm2O7EewmxZ3h2DKSkfSfjK/LG9pUmbLZawCn+IKmRxCNw120y1I+IzRQ8NvTQ
         ymETb+iq75W5Y6U3ykBO1LMval143phd02ceQA1Ih5SD6bPeXgUsKVxtAZ2VsJW4hFC8
         62coiSxfM+VZSY1FcrJzv6ipCX5E9RL87gqrMFhYYl6/xzO1FTDz9P5FnHtf8JLDV/7i
         dnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+IB+UJijWjaTnFVpSDyUcRlyFG+GunEChS+weWwWm14=;
        fh=xZbZC3ceYH+UQONTCpBhIQY7Yo74QdOGPrkS+NYngik=;
        b=cZXwfIynDsYdAi7K6ZK/9otkAnr1TrqU3FjxSFzTjRWLiwhv2NZyyYv27eamp4kB4d
         TUBirwK0W+DPtUFFZBlmzDKl7aReP2HxYBLGdVt6GUiw12MAIxHiiRUaaMkb4Qws7qbN
         UwUDnZ5rJcrxCxVWujTEGQsCvNF4x0vkP0t/R5OYAhQ0JIriu+d0T4n60rs+x2eZPkMB
         xyb8fsAfYLXdVIg7UTXurlx7sm3HlACHf3MxpgjVXuI2vTWThpKlCeOD0FWLhRnvBSnl
         lcOYa/mPHVYmD6jS4l+2WunipmdC5QjnE8k5y/+Ux0xNGq1owKSgz/vjoTeWyU3EhQa6
         dUJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790092195; x=1790696995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IB+UJijWjaTnFVpSDyUcRlyFG+GunEChS+weWwWm14=;
        b=BgxwzVEblWiqw4mRVWVmI4pnlSxui5x0Bf2OsqGawV5jibxnZZTyjI4MjWPGo2rORP
         UT6n/LXhCEKVuxz8IonyoR1PKSb5yUCKUVvf4DGwH6ODiisG6cGvoZi/pu155G+mFP34
         oPSxUs//AqOi3kpCEhwsxxKi+gjRBPzCP6Ana/VnUzg7JLEY98J6+DsmqNCyE5As9b07
         zioKxS79+XJ1i1Jw2TTEd+bTdobHk1YebdEh1JY/ku0Y72fAbnSF+hT5hbgVAPei9omU
         3pjrJOaLYHmx8r/Q3Sv4TC6ewMkMQF9bysJadkgmINToJbiVvoLNJRONum13BQlWHFoF
         XaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092195; x=1790696995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+IB+UJijWjaTnFVpSDyUcRlyFG+GunEChS+weWwWm14=;
        b=hEuHpqcYP8iEGJMOv29OY0xnVNRdWNGMoWr8WumDuaQJjRJor4uDr95FKcmsKTp8jn
         Wq/Vvm1hsgsvHFbmrmtsmD2SH6smKpdWkgp6FmuNuDNNzJEyW2t6YenjP13yuU3V+Z2Q
         1QRB8thNtPPi0L3LIGwBv9EVDWS9Y8GPC3HSbUtc+YiPJV+9Q8RdFqbKapkP+GOmML3t
         yPy5NkInIsRkUlX3iNfeGzcYqbrdo2TlYKL5shN8o0OK/w6y8TFKOMlLRfkk2swIRWR5
         QXM+1D4AYIQ27k/dwos/W9YxhBmIuJbiew4/Ymz3ey1g2zl0jHykAz6+xTRjvSmNZFAU
         SSTg==
X-Forwarded-Encrypted: i=1; AKwUvByniFsTPwNeYyW4zL/tBq2rHfh6wtUTtcR2PNhzl/y0qo+bxHiIscuJQIx2/MD9D3mpOmuFhhTVmRDZqMs=@vger.kernel.org
X-Gm-Message-State: AFuF++meSLdwmZ+tN4DWfgFQxsKVk4m9AN2uTQrVxonrIuDLnNYMpBcx
	pEN6aSytou4hqB3A9EFZZFNe3SBEK+3tYZkH6OhOrL/ShSVyMMD1Hafd6Hvy80b1lsqx/8mmu8Q
	DuryCG6k00PLvzOhmTmS/5AMv0jNx2KxGG6aDumEjqw==
X-Gm-Gg: AYBFou06sYUaAZ5BZ0f0TJADrOuFD2NqS72xLemQaj8Fht8l7o0TAi3K/+BBCijg0Rs
	SVr9IHCQtVfpL7Q67QSjgNyB1zUlwcD1I8uEQEiN/95bxjm1nURvQcgHQAlWhE6pOP/OCa/HvdA
	iRq/L0GTmE7yjcQLqM5AA1KfdowklfhQ8ZGb3GbjQwHemoyVPILeHzp0ory3yeAMIH0txt2wXaq
	iMRbvwW19gQ9ezYXlHRzQ9QoEFeBj4TWROQ+LUGsPewlw6ACRZjEV4L4lkJZ7nB3/ioOepwYYkx
	bTO0o+4ovpXmeabb+s+66kbq5j9XH1xh4p99+mGRhoaez9oqwzvhbnkXEnK4spDBHJN9aoTzbrR
	UYupzq5PZ6BLoa8apPUMYo4yDy+/Uaucyoa4SwjVkTtLSaCcw27ZkHd/QlGm5ndh3QNPMVmM=
X-Received: by 2002:a05:6820:4b91:b0:6cd:3ffc:e32a with SMTP id
 006d021491bc7-6cd3ffcea03mr10302175eaf.72.1790092195059; Tue, 22 Sep 2026
 08:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922084009.506362-1-lgs201920130244@gmail.com>
In-Reply-To: <20260922084009.506362-1-lgs201920130244@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 22 Sep 2026 16:49:38 +0100
X-Gm-Features: AcwNN1UYho_M2TCkxcYs2QRUgoK-S9ENUK4v-9idaeTrzc5fL3QAaoHR4mTs8VA
Message-ID: <CAPY8ntD6kWi7Q57oL43SLe37szXpptdBXs6cs+vxVehA0eJPjg@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: ov5647: fix power cleanup on remove
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Guangshuo

On Tue, 22 Sept 2026 at 09:40, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> ov5647_remove() disables runtime PM without powering off the sensor if
> it is still runtime active. pm_runtime_disable() does not invoke the
> runtime suspend callback, so the sensor can remain powered on.
>
> If the device is not already runtime suspended, call ov5647_power_off()
> and mark the runtime PM state as suspended.
>
> This issue was found by manual code inspection.
>
> Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> v2 :
>   - Move pm_runtime_set_suspended() into the conditional so it is only
>     called when the sensor is explicitly powered off.
>
>  drivers/media/i2c/ov5647.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3facf92b3841..3b3e5653a0c6 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1271,6 +1271,10 @@ static void ov5647_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&sensor->ctrls);
>         v4l2_device_unregister_subdev(sd);
>         pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev)) {
> +               ov5647_power_off(&client->dev);
> +               pm_runtime_set_suspended(&client->dev);
> +       }
>  }
>
>  static const struct dev_pm_ops ov5647_pm_ops = {
> --
> 2.43.0
>
