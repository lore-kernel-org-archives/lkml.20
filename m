Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71CC526ABA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651680; cv=pass; b=ej7Pnjp8cIzu9FdHX/1khVA0HMvma63CWS9ADGFkb+p8yvoGlBPayX+Rig03V1aSsRHXATVIw/mhWalCO+cQWsOzfngEE62Fnd4azcXQR5f6kc+wMAGXo8eIlJh03e856tFN9Xakgc2FIzgLaTn5wQOAIKAmG7m/HsYj+pZnYoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651680; c=relaxed/simple;
	bh=TXtU25lOH5dMtACZ7iziOB2oxE4cZXtJfR9DIYvkgR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHzD9sEo3/w6krzxQO3lu5V3WrPcY518t45PiqyR+tQE8LhX+3eET46vIJ5NdjARGULzE0PiZOQJqzU43FB8hs3hgj14h/lM9QgNRMqldub1ZmaZcOBwcm3CnfUVGJTo+1A7EB5WC2TamG7VspReVV84EiuWgmdDDCT1bLvlS8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Va8wfZDc; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Va8wfZDc"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910cc46c4so52728985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789651667; cv=none;
        d=google.com; s=arc-20260327;
        b=JuOKG4ytE9HdoFjDRfQPcjvRJq1Havm29U9pL0E/3Otlv+fjCaLL/Vnt+OaYSIQpbJ
         o6fEaGbkZv8xk4CeQrnOcBwNXDHrw5qjuFoeQy1usS3f/hHVVtOPXeiMeDvCybZYgWxU
         /yMXJHcsHgnSjPWJZjIDRlqqnWoRTQ0Iqvw2Dq9i0CzDlQ6Kd3FStYiIwqzs17C0tEDo
         62F5QOJmMhq1d0ynGgLBNzTjnA5F9jKRrUd3ieZ6FpMimA/wbfvQu8/KmVuXopPEO2tJ
         IXCJEFL0fqPCsuVgvk+ZyWbgWWu7yygUiu3eA6ZGd25/mgfdSuSvQAPhj+n9jhnI5jrn
         uACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BAW6djXECzYrmSVVgeAoFqiFa+eST1RRqM7bt/yc2VY=;
        fh=trbCn+P9Wg2XwLK0tVSi+TnhM3lCWSQ1eDUfRkicxdM=;
        b=qaJzsR5MX9mhD6Zsv7Q4e5AdTahrLo/cPEp47BpG1Y5i7WTz/55w6CAgjlVmejtOzo
         lPCsHkTcH60kpuWgPSBqWTvnj1bKWbrioiG7IYt/xhf8q/exPilqOjt/TU+tCgq8gVwj
         vp24A33iTEUFfc71M+lAyJwiJ6Ak04UPKkKAYkxqqcLaq36fxhRA/K08JPTLCzKTSijp
         cbcFY3NkTFQAJ0rbZPqg3LG20oXYGDhTadkaaewzy5vW8Nvl2Fn8DX86fQ2XotAAq40V
         rPKaQZf7uTChH+rURCzRA5UGQ3JVzH3OlHOQ8SY+1W3ogH9OBMmfXntAvXWSjNdeQI7s
         22dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789651667; x=1790256467; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAW6djXECzYrmSVVgeAoFqiFa+eST1RRqM7bt/yc2VY=;
        b=Va8wfZDcFdgq5TMDukKEUtut82zznutnHHSqL/nTai4Lixf+OoKnnVWT9hpz8X5ZGm
         pXwI/qhCWChNc8Zm0wqBDkRGtZbzgQqyF1fIWUu3t4dxdJ+wky2d+bFpPc1BnbmtDRGW
         txgCfX2fQpdg9iVF3vU2SNWG90uXd4iIf49QdlkYnIH4cw+f27QvY8MV2XoQdPTX2E1B
         ESj+jKWN3h37kaN1INYNXC+aGUKmD7BdB+GBkLjPaxTv8aCAH1yfZZ3hty+dVpEYHZsl
         xmKTz7BOMO9P7fTs4lPeEhjznS3yXKc+/CcOsO2/KdYApjWPfqFIkGmAnVeiFyTeYzRa
         6Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651667; x=1790256467;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BAW6djXECzYrmSVVgeAoFqiFa+eST1RRqM7bt/yc2VY=;
        b=Alfd8P82AwFm9TzzxOsUqrbyRfufkDPApjEDpjVA1sKbZEeRFSke/oJUTEU0DZzPlU
         a+5mI/F0A2ybu3zP4IsULi4Zedis7qcCDJd5gi9TVfbclq2G/1YPDFng4TWcW8aPAynW
         mCml9a9k4helV1LsqLCZp0YSL/pUkJD8PXAvxoBR/oRoh9BX75K1sbNI6vb28SEk3Skx
         LPUXoVdcvced0Ygf2p2JLOHNk7PgRSQT4DjzSKNQP8xbeFA0MEw4F6aqN280vR2261AQ
         oH6TTWs3vXGMFJHukM8wP/ULT2FCZs+3Q+4k+Mpm80TO6iKOgMFY3xikKeOT/6SfVKXm
         I93g==
X-Forwarded-Encrypted: i=1; AKwUvByO+UDoYx9fa4+iHkIP5vrEgV+Aa+uD9JSgCboFHjyjpxvQj8+O3MZkM4uOx34SxoU7lhfyYrnEr/LYoiA=@vger.kernel.org
X-Gm-Message-State: AFuF++nkRzYvEDyqWL6WAawQuhzOb+aHtIPh+UZAR3WcD8si/At5SGFe
	Z53l/U/1J/tiJk62SGquHdwMdNj2y/v9c0Q9FYJRiP2yFmGi0s6tOcKZL0zrtrhs6YzFCcn8mnq
	2ocQfG522Tjv88girw5HanPv5h3sqdMFqll4ozrxhww==
X-Gm-Gg: AYBFou1cW4S6sv1vIjEJym5qpTZv9yeo6DgZP7AJ7RtWAVttmKyW6SS6IpZ59kbJM6h
	+k0FElChA+2uVprQfWUBGKzR4iIjTDh7vRGCrqmgrlkWic3NBxC+gmdxmXnJl5LeyFwNPz+kF2g
	Ze9w5rP+kBc+4UFWJW0hTPehPZlNH9/DCf7NHLybnJc0EdTRFqU6o9sgkfDTzP3uE5nxVI++pY/
	v2qtAHD1cgTqiKIElouQo6QJyWJ07NRcOXJyCo7lQrNCICLSkdn2ej1IfheuyJlXPXuI7lJsD8x
	QknbBAN5qEaYDqRKwyleuCfJT2I4e21omr2ifb6SWpvO0rxmUFgscXi4tyL/67QVueph5UHRxOm
	Re5iYQsOfafvzeXPyz5vk1hPHENT0G5yt7H8DI+A1CxQLjnTLsvmmwlY2EH1egMCUe8v6eI4=
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id
 af79cd13be357-93bb796a4c8mr1114936285a.50.1789651666676; Thu, 17 Sep 2026
 06:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915090457.2342778-1-lgs201920130244@gmail.com>
In-Reply-To: <20260915090457.2342778-1-lgs201920130244@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Sep 2026 14:27:30 +0100
X-Gm-Features: AcwNN1VtPNHGDzm-Brpio99oWvACBn2y0PZApgP4nD88EIW-t5kvm83lCSZc0OI
Message-ID: <CAPY8ntA2h_ChCWJbAmCVygYiviTdsd9TA2LcVh5ffto__LgZAg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5647: fix power cleanup on remove
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guangshuo

On Tue, 15 Sept 2026 at 10:05, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> ov5647_remove() disables runtime PM without powering off the sensor if
> it is still runtime active or updating the runtime PM state to
> suspended.
>
> pm_runtime_disable() prevents further runtime PM callbacks and waits for
> pending operations, but it does not force the runtime suspend callback
> to run. If the sensor is active when the driver is removed, the external
> clock and regulators can remain enabled and the power-down GPIO can
> remain deasserted.
>
> After disabling runtime PM, call ov5647_power_off() if the device is not
> already runtime suspended, and then mark the runtime PM state as
> suspended. Checking the runtime status avoids disabling the hardware
> resources a second time when runtime PM has already powered off the
> sensor.
>
> This issue was found by manual code inspection.
>
> Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/i2c/ov5647.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3facf92b3841..d42d009772ac 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1271,6 +1271,9 @@ static void ov5647_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&sensor->ctrls);
>         v4l2_device_unregister_subdev(sd);
>         pm_runtime_disable(&client->dev);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               ov5647_power_off(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);

I was unsure whether pm_runtime_set_suspended can be unconditional or
should be in the if clause. There are numerous drivers doing each.

As it happens, Sakari's just answered that in [1] that it should be
conditional, so I'd take that as gospel. It looks like he's given a
similar answer on your ov2740 patch.

  Dave

[1] https://lore.kernel.org/linux-media/aqvb_n-aPcXLnEa7@kekkonen.localdomain/T/#u

>  }
>
>  static const struct dev_pm_ops ov5647_pm_ops = {
> --
> 2.43.0
>
