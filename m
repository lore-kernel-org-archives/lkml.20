Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616878;
	b=WcRb/CnYR9A9xTTC9kUC4aDpIWxE9DX45WMn8eyjUNcTSoxShp9wdPRa3ahSC+l59KGL
	 sN5RMDy+/aGsSMG5z0n2w7EKZCxo19Gl3s8xs6aYTqV99X6aem0ir3lGO38KVN5LUOOjG
	 XyDJYkRM03tftjSU833iBCKSjbIDaI6DxD5Cii6vaRYKVE7hHWI4RCdjx7hNREuR4ytkM
	 n5QRi6CUr6+j+P22wjfqaaUFmiffqFIF5NuS8JdhrVlqKZWfZUwBkSMtajh+y6lKbu+7E
	 RimWgDBvG8P0tXN0rWr2DZT/ktVWOFnL39kqIrwy5u1V8TuQQLW1h4h0wkTYcetVciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=JLjm6QlrOnf4m+CKqjntQj/9nw44DYlmra61+XkJwSw=;
	b=fcZ5tE/BvZ2vJvyzUGesgv2VNlQjao1FE02QhiZiUd000D6UWrLhPWMsmYzsSwrUJD05
	 v43JuiwBMfgXByFDnp5SsTHvrPPbSweB0cxu1DSKxN2ysUQJgm9pvlaMtgKPIdTQ2zt65
	 uupECF7yWf53S9bAoip0FQVg/InBH09I9FFT3d81//aBt4c62Wk8BQP+4bmvTTbnvdoUh
	 IeL6aIGAi2TEKSQIkg4FOeL6ddS3uDW4bBXJPviDHIIHUJH0mcmBFlKbEZyW639Vm3gqC
	 e/G0CVQJHbCo3F3oYhrUMVDOB7Z2HElAoEce5ZHHN4BglJuu0yS0F0AT7ay2YrJkvlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KZ17htV+;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A5606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278A5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KZ17htV+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so1556284eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616876; x=1793221676; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLjm6QlrOnf4m+CKqjntQj/9nw44DYlmra61+XkJwSw=;
        b=KZ17htV+gRuoa27dG300tIMNXOcFuH7miZCa6cugXWEBDC5+pRvSRygf+HK7fFF4Be
         Uw7iP828Ns7v33Y4ujFt5zHuGP5wSJ2eBc49NsaAJ6qWIrtDRmVAZM7wsK7g3eZnlCBv
         uDXT4K1Sw8aChcGctks3pStqZG/+0XX899cQecENn7sdL25GnznxHbKZUYaSveI/IeN/
         89yWhTPe7CP9kjF/non2+pLpa0JS1SxuCg7pt/m3J0h0g99rvViKZQIaSC4MyqiqVDFd
         DiNxx56SilRE06EG7wDeeLft/6UiquzTkWDcdNck4I1GwaaYz2Z+689U8MhSIOgjbkFw
         A7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616876; x=1793221676;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JLjm6QlrOnf4m+CKqjntQj/9nw44DYlmra61+XkJwSw=;
        b=Jo8biy56yn+/RhLyUD3CmdoeyFqiBRgglKeGOCDsoqBNt2FBXE/VLBdzhCdAVlOInx
         zXTmhIAp/b6XNiNivGmTz+QmZ+ys4mO2jhDh0sQXU0Su4uKLzWomucM/qjI7PdzKpCUW
         oIrm5zxH9MoQTX6day3WngCXoN6kFx6KUsb6IdYZGqxlMMTKKfr9j9AQQuy61kmADA+e
         u6A2inZl8Y2JCi+SN5BMdsEUuldSel/vzr7VaOeqr0Ihv02HMmbqm+E3yX7A0MurGCzx
         GdP6Dxir6BQM5aOK1SwW2geKvWnQIoZOnGoFA8ZKLiLtgdlo4GzAJPlBSEBA5mrW0He+
         kJkg==
X-Forwarded-Encrypted: i=1; AKwUvByNAasVTHcw+snrz2hPmKPw52SufU8/+DSusCwdt4G/AZjuIDJ7RyIYHM5pPHgunMRUSk2eNbj8NxzOM1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzCyDn/g+1z49HoGAuTJNSM6zGuGXho3f7qgRjjVZFQMwBxfTS
	51NMmKbHU4fkUaBtOrrR/g3Xl+FlAK00yiA8nxCLrIaVGuXm4UKx4ES2
X-Gm-Gg: AYBFou1M4udwrFt1E+n80446xRG3cj2jITTpkl5M6gOfcQ7zrwlrt+VBwxbqxYvWq5w
	qCGfukWj63sYTkxVNbBhx52Hs4YEDxMpgN1fIvAJ5ble5EMgoNVDSPzy9wGZY4FVmVpQuQR2zK9
	zp4AqiNJKxICnLpvlOowrU83S9+dMP8c4OXc1K5bIGyyxzsjKk3LXdMBeayTcw/zfS+aKIcpLLi
	thzT1z9PEksNBwutPMkgoWrS8IdhLFIuKPz4adVsYs+OQIFJPTm4M+DNzi/76a8zYa+8pnyjLyL
	17AgeT+12p9EMbXXtaHIiOabHsokb/DII6yv0i7Or5BO7EybDiLTtr36yW0642Fx6b3bE95MuOo
	icI2G9n/TKI4ILe6phdiX7B/8iARdHbGFPAno5kp7ahxUEm524TnKtgTtnfuH8XL34sbLimdo0c
	6BVDsqVxGl74F6anTOcxX+/I8bYxHZquYsTkxF2xEasOaXa1/RUD1b70atMXPUFL5RPq/LOqtbH
	4KOSCWBryyYjf1WsqgY74ay7c2hxiCn1DagS30dForB+VaiY6qA2nPDWicX2gaPJgKpTht63CgM
	V1APR2qrF8MA3icFLCdO
X-Received: by 2002:a05:7301:2411:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36858cac5cemr1399501eec.7.1792616876048;
        Wed, 21 Oct 2026 14:07:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm10203781eec.3.2026.10.21.14.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:07:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:07:54 -0700
Message-ID: <14ba3b960ff6ad152fadb4e77a9b04fd@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sanjay Govind <sanjay.govind9@gmail.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	Qbeliw Tanaka <q.tanaka@gmx.com>,
	Kees Cook <kees@kernel.org>,
	Shengyu Qu <wiagn233@outlook.com>,
	Kyohei Kadota <lufia@lufia.org>,
	Elliot Tester <elliotctester@gmail.com>,
	Dmitriy Zharov <contact@zharov.dev>,
	Zoltan Illes <zoliviragh@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] xpad: Overhaul device data for wireless devices
In-Reply-To: <20261015220126.102766-3-sanjay.govind9@gmail.com>
References: <20261015220126.102766-3-sanjay.govind9@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Sanjay,

On Fri, Oct 16, 2026 at 11:01:28AM +1300, Sanjay Govind wrote:
> Xbox 360 wireless controllers expose information in the link and
> capabilities reports.
>
> Extract and use the vendor id for wireless controllers, and use
> the subtype to build a nicer device name and product id.
>
> Some xbox 360 controllers put a vid and pid into the stick capability
> data, so check if this was done, and pull the vid, pid and revision from
> there.
>
> To make sure this information is available when the input device is
> created, delay creating it until 500ms after the pad is reported as
> present. Some devices never send a capabilities report, so the
> timeout ensures they are still initialized.
...
> @@ -746,6 +768,8 @@ struct usb_xpad {
>  
>  	bool pad_present;
>  	bool input_created;
> +	unsigned int pad_gen;		/* bumped every time an x360w pad goes away */
> +	unsigned int input_gen;		/* pad_gen the input device was created for */
...
> +	u8 sub_type;
> +	u16 flags;
> +	u16 wireless_vid;
> +	u16 wireless_pid;
> +	u16 wireless_version;

I saw your reply to Sashiko about adding a spinlock and snapshotting
the wireless state for v10. Stepping back and looking at the driver as
a whole, grouping the wire-level discovery state into a dedicated
struct protected by a spinlock will also help clean up a few other
races and edge cases in the current state machine:

	struct xpad360w_pad_info {
		bool present;
		unsigned int gen;
		u8 sub_type;
		u8 flags;
		u16 vid;
		u16 pid;
		u16 version;
	};

> @@ -958,19 +988,16 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
>  
>  static void xpad_presence_work(struct work_struct *work)
>  {
> -	struct usb_xpad *xpad = container_of(work, struct usb_xpad, work);
> +	struct usb_xpad *xpad = container_of(work, struct usb_xpad, work.work);
> +	unsigned int gen;
>  	int error;
>  
> -	if (xpad->pad_present) {
> -		error = xpad_init_input(xpad);
> -		if (error) {
> -			/* complain only, not much else we can do here */
> -			dev_err(&xpad->dev->dev,
> -				"unable to init device: %d\n", error);
> -		} else {
> -			rcu_assign_pointer(xpad->x360w_dev, xpad->dev);
> -		}
> -	} else {
> +	/*
> +	 * Tear down the input device if the pad went away, or if it was
> +	 * replaced by a (possibly different) pad since the device was created.
> +	 */
> +	if (xpad->input_created &&
> +	    (!xpad->pad_present || xpad->input_gen != READ_ONCE(xpad->pad_gen))) {
>  		RCU_INIT_POINTER(xpad->x360w_dev, NULL);
>  		synchronize_rcu();
>  		/*
> @@ -979,6 +1006,19 @@ static void xpad_presence_work(struct work_struct *work)
>  		 */
>  		xpad_deinit_input(xpad);
>  	}
> +
> +	if (xpad->pad_present && !xpad->input_created) {
> +		gen = READ_ONCE(xpad->pad_gen);
> +		error = xpad_init_input(xpad);
> +		if (error) {
> +			/* complain only, not much else we can do here */
> +			dev_err(&xpad->intf->dev,
> +				"unable to init device: %d\n", error);
> +		} else {
> +			xpad->input_gen = gen;
> +			rcu_assign_pointer(xpad->x360w_dev, xpad->dev);
> +		}
> +	}
>  }

There are two issues here with how pad_gen and xpad_init_input()
interact:

1. In xpad360w_process_packet(), pad_gen is incremented on disconnect
before pad_present is set to false, whereas xpad_presence_work() checks
xpad->pad_present before reading pad_gen. If xpad_presence_work() races
with a disconnect packet, it can see pad_present == true, read the newly
incremented pad_gen (along with the zeroed metadata), and set
input_gen = pad_gen. When a new controller connects later, pad_gen is
not incremented on connect, so input_gen == pad_gen and the new
controller will never replace the bogus input device.

Bumping gen when a pad connects (or on both connect and disconnect) and
snapshotting the entire struct xpad360w_pad_info atomically under the
spinlock at the start of xpad_presence_work() avoids this completely.

2. xpad_init_input() sleeps while registering the input and LED devices.
If the pad disconnects (or is replaced by another pad, which pushes the
delayed work timer out by 500ms) while xpad_init_input() is executing,
xpad_presence_work() will still publish xpad->x360w_dev upon return.
After xpad_init_input() succeeds, please re-check under the spinlock
that pad_info.present is still true and pad_info.gen == info.gen before
setting xpad->input_gen and assigning xpad->x360w_dev; otherwise tear
the newly created device down via xpad_deinit_input(xpad).

> @@ -995,18 +1035,98 @@ static void xpad_presence_work(struct work_struct *work)
>  static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *data, u32 len)
>  {
>  	struct input_dev *dev;
>  	bool present;
> +	u16 parsed_vid;
>  
>  	/* Presence change */
>  	if (data[0] & 0x08) {
>  		present = (data[1] & 0x80) != 0;
>  
> -		if (xpad->pad_present != present) {
> +		if (xpad->pad_present && !present) {
> +			/* Forget everything we learned about the old pad */
> +			WRITE_ONCE(xpad->pad_gen, xpad->pad_gen + 1);
> +			xpad->sub_type = 0;
> +			xpad->flags = 0;
> +			xpad->wireless_vid = 0;
> +			xpad->wireless_pid = 0;
> +			xpad->wireless_version = 0;
> +		}
> +
> +		/*
> +		 * Also reschedule if the input device does not match the
> +		 * presence state, e.g. because pending work was cancelled
> +		 * on suspend.
> +		 */
> +		if (xpad->pad_present != present ||
> +		    xpad->input_created != present) {
>  			xpad->pad_present = present;
> -			schedule_work(&xpad->work);
> +			if (present) {
> +				/*
> +				 * Delay marking device as present, so we can make sure
> +				 * we have received all the information from the capabilities
> +				 * report. Some devices don't send one, so the delay
> +				 * guarantees that these devices are still initialized.
> +				 */
> +				mod_delayed_work(system_percpu_wq,
> +						 &xpad->work, msecs_to_jiffies(500));
> +			} else {
> +				mod_delayed_work(system_percpu_wq, &xpad->work, 0);
> +			}
> +		}
>  	}

Checking xpad->input_created != present here causes a problem during the
500ms discovery window: while waiting for the timer to expire (or while
xpad_init_input() is running), pad_present is true and input_created is
still false. Any status packet (data[0] & 0x08) arriving during that
window with present == true (for example, headset status bit 01.6
changing) will see input_created != present and push the 500ms timer
back again.

The only reason pad_present and input_created can get out of sync across
suspend is that xpad_suspend() calls xpad360w_stop_input(), which cancels
any pending delayed work via cancel_delayed_work_sync(&xpad->work).
Instead of checking input_created in the IRQ handler, you can simply
reconcile the state in xpad_suspend() after stopping input and sending
the optional poweroff command:

	if (xpad->xtype == XTYPE_XBOX360W) {
		xpad360w_stop_input(xpad);

		if (auto_poweroff && xpad->pad_info.present)
			xpad360w_poweroff_controller(xpad);

		xpad->pad_info.present = xpad->input_created;
	}

Also, when a pad disconnects (xpad->pad_info.present && !present), it
would be good to do RCU_INIT_POINTER(xpad->x360w_dev, NULL) immediately
in xpad360w_process_packet() so no further input reports are routed to
the old input_dev while teardown work is pending (especially if another
pad connects right away and reschedules the delayed work for +500ms).

> +	/* Capabilities report */
> +	if (len >= 21 && data[0] == 0x00 && data[1] == 0x05 && data[5] == 0x12) {
> +		xpad->flags |= data[20];
> +		/*
> +		 * A bunch of vendors started putting vids and pids
> +		 * into capabilities data because they can't be
> +		 * retrieved by xinput easily.
> +		 * Not all of them do though, so check the vids match
> +		 * before extracting that info. A vid of 0 means the link
> +		 * report did not provide one, so there is nothing to match.
> +		 */
> +		if (xpad->wireless_vid &&
> +		    get_unaligned_le16(data + 10) == xpad->wireless_vid &&
> +		    get_unaligned_le16(data + 12)) {
> +			xpad->wireless_pid = get_unaligned_le16(data + 12);
> +			xpad->wireless_version = get_unaligned_le16(data + 14);
>  		}
>  	}

Once the capabilities report arrives, we have all the identification
data the controller will ever send. If the presence work is currently
waiting for the 500ms fallback timeout, we can expedite it:

	if (delayed_work_pending(&xpad->work))
		mod_delayed_work(system_percpu_wq, &xpad->work, 0);

That way controllers that respond to the capabilities inquiry are
registered (and have their LEDs initialized) immediately without waiting
the full 500ms, while controllers that do not respond still fall back to
the 500ms timeout.

> +static int xpad_inquiry_pad_capabilities(struct usb_xpad *xpad)
> +{
...
> +	return xpad_try_sending_next_out_packet(xpad);
> +}

Since the caller ignores the return value, please make
xpad_inquiry_pad_capabilities() return void (matching
xpadone_ack_mode_report() and xpad360w_poweroff_controller()).

> @@ -1943,8 +2088,60 @@ static int xpad_init_input(struct usb_xpad *xpad)
>  	usb_to_input_id(xpad->udev, &input_dev->id);
>  
>  	if (xpad->xtype == XTYPE_XBOX360W) {
> -		/* x360w controllers and the receiver have different ids */
> -		input_dev->id.product = 0x02a1;
> +		if (xpad->wireless_vid)
> +			input_dev->id.vendor = xpad->wireless_vid;
...
> +		case SUBTYPE_PRO_GUITAR:
> +			input_dev->name = "Xbox 360 Wireless Rock Band Pro Guitar";
> +			break;
> +		}
>  	}

Please factor this Xbox 360 wireless ID/name setup out into a small
helper function (taking input_dev and the snapshotted
const struct xpad360w_pad_info *info) so xpad_init_input() stays
concise.

Thanks.

-- 
Dmitry
