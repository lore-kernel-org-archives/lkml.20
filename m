Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712139;
	b=OMF/Z8NIcPLegiotfb1wpDebmmM9bHYnY+otQsxHpOUdw1G2R8VDhOh5C07tG5mE2CZv
	 +ztyOod7iLwRyPUWljXY/DxDyd1dappsBLmDrX0KafObE8555LMWGs26O52svXevkERZr
	 kWHxIfgz4pBh6goe87O0h/4WXwx4BgETc4DfSwxuM/yZYa1d1Fa9uHJPgYxrmjoYuI/gU
	 IlQ4ynCWwaJNcVjrd44icLT6sxwB3FV4KgTB+kkYJwoXsjnQdIv5kMUZOW2OJEfrpSBqE
	 FXmg3tIFbrq6tBX6stkwGvcB8M5RKlmwbOgSaAeTvVRLO26YSvLbqzFpbWpTUurFYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XYng5pWI4USr1KWNzMKOzbrap54zZqn6X9wIRG9MW9w=;
	b=acqxQ3fpeL7q0mLJ7PzQKdyMT5lxo5Icj0O19kpMiWo+HfQDoUjQP7AjTcED+Je/V0tb
	 ipBYYsNKHG0hEitGeg2L3w7P6RJwfeQY4t1Qqiwh4URIrnZeZpPbSoZdPPY4sUy+YaJES
	 RnHXrKWyCD6euzcxru7fo9wCB9qVs2yjbnqIOyLwYzXVbXbUSh68II3Z+VmQzoy6xZDqw
	 gOMCeOPnui5CDlIccBS1AQ6MTvgYbGCnjVNopt96zEC62z+pe4EhjgRFM52rgxx0lkCvQ
	 5Tkx98qz8X3jtz8KhoYOKqNDh1hBY1dEFxZh3m8T2JHkRLOSUiDYJKsqoF+wXYm9yZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=charmerstraining.com;
	spf=pass smtp.mailfrom=pythoncharmers.com;
	dkim=pass header.d=charmerstraining.com header.i=@charmerstraining.com header.a=rsa-sha256 header.s=google header.b="otr+/RE0";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B85606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B85606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=charmerstraining.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pythoncharmers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=charmerstraining.com header.i=@charmerstraining.com header.a=rsa-sha256 header.s=google header.b=otr+/RE0
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2588275a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=charmerstraining.com; s=google; t=1794712138; x=1795316938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYng5pWI4USr1KWNzMKOzbrap54zZqn6X9wIRG9MW9w=;
        b=otr+/RE0BqvlFd8IX1bR3mOoLTwt9V4RJF5t755jpLkG4vg9lpAmTZ8l9TOj6jLBTW
         xHKBv6NF42ksaeQwjnesqxb77yO7uKj643lXOm0ULV56oVTkJ8ywHhvVzbVPVqUdgkYH
         Zx6sSWhGRRqGs1U/Gcz45JaPAAahwRpJOXuiSZxuNnzzwUS+ITSQgAVA8/oUa8Z90QLh
         Dqaran/d2T8uRKQORmallc41cMp5PGkPDKpeoTJOHPR7lyy0WrIF0A6gMI0DFmiTjOmQ
         ZYdipZiXpzmX/EiwchHD2qGPCJunsso9ihSPbIlDLNB7ESevzlU1AIgcWbeiaNCf0VUR
         SQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712138; x=1795316938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYng5pWI4USr1KWNzMKOzbrap54zZqn6X9wIRG9MW9w=;
        b=l9/4MVytOkC8ICwEQ1k11hYNh5OhsqB6T0EOCMfNKfx+yJMSPL7cPZ/cFjWXKygfW/
         gDGgbfs7WtETc4C8BWIgcHiQppvNHV7k4caAjFwxgxnB4WevEjuW9RDIheTauLIDs+qi
         /WH/RP3A7hLgD2haEH1gNV5Ib6v2TQojilig0fBP11sKRoUmu9XowGmlLnKAUMq80a8+
         LoukUopu1+Ejh0rcBdj0OdHw8BduFv1/6EVZ1WWP3P9ZqTQbHqEh5wWgY72Nnkejh8OI
         T90nq4tYTlgyPoddwj/xs4OH5UK16vsyCGHCVD6u1lVK1rjWvmzW5Gaq40MlMz3GwQqs
         MozQ==
X-Forwarded-Encrypted: i=1; AL+hErG/uwc6ZxSjQLXAfGs6w2UVTkPD6/8kUyYBHnWrClBxavZ492c5y+zuhvI0mmyrdbZunWJdNui/uRgV8JA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BKK2MjXw5m+jH1jbOI7AGi2ULriWGLPvcN08MWzh6347izdBg
	ez584a3IA10IDdmWTf34TmiXPrUEzq7b4I+p/q9FMjhE4BfBPuXKR51Le4f4R5Z9qqA=
X-Gm-Gg: AYBFou3NJK8LsPRne8Iu+Cl+ZzfnuST8sJ4T7wy9XGwiNZxI8U+fT7ebfKxH0DQcEZf
	b4k5Gi8sX5XDOoAPDQPnfuXghzHIf+8DVIE6/5mqhuz7dlq2EF21jUkv+NfDHme7LBvm0WmlKbG
	VuXU/AFJF0QieJGXSQwBljfJ3SxlkTA2vITrnyQ1FPL7lsY/WLUfrGsy3XlHFpxCzMIbfJPbGfg
	AH/EDM7O+KPqisb8Cv9ceavkRPjtqMWfc8xUMcwbMpNmrSgRcWwWEfXpWdaUAWtxRhkeXl0p1DL
	RwUUh+GEc5iu8vNjYMEQP/3RNLdFVZcB6+FIAWV9iDguuGDVmHCYE9ItE5vlVP2TIJJaVPD2DfF
	DahugqcCKVc1g5i2lsDiEo3RSH56l1TXKFABJfpygaKkeMF72sbnQbwEkDvcmxpudWtQiY+RaJR
	2381jig/pm8sALi3jDsOIkzuKzLFP6PhT0UrqNWgrkocMhrZXvGAl7s4Im7i/e41tKWIfcW2VqQ
	OdFGh358+fRJyoRzWRqozLL1KAGAfLzoRW37lVE5GN5oHfA0edH46AG4xnkDVClC/wkHi/Wg2K0
	dTn+e3KjxobgXLIxt6m4RxmEvN5QiMDDaL+WJ5FL6Ku8tYIe97ycQOJrm49Twsl6kCNed3flleB
	Q5aD5xjGJJ4NIU4tsaizfJxKFb34C0IxiCHRVgA4vIcQ2myFD6tuA2UsU6NL2lU3JwMpkqJVOBk
	GjQdhKbaRFjm1hvsYw7125u12KS5yVlhl+5zeH+hz9HD7CtZ7hL4K97w==
X-Received: by 2002:a17:90b:4c49:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3b1b0b8ef0fmr6902713a91.28.1794712138264;
        Sat, 14 Nov 2026 19:08:58 -0800 (PST)
Received: from ip-192-168-20-3.ap-southeast-2.compute.internal (2403-5803-1750-0-d1fd-685c-f50c-5901.ip6.aussiebb.net. [2403:5803:1750:0:d1fd:685c:f50c:5901])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm15422530a91.15.2026.11.14.19.08.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 19:08:57 -0800 (PST)
From: Ed Schofield <ed@charmerstraining.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Doitall <diainquiries@protonmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/amd/amdgpu: Add 5K Support for iMac20,1 and iMac20,2
Date: Sun, 15 Nov 2026 14:08:48 +1100
Message-ID: <20261115030848.17705-1-ed@charmerstraining.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113214721.9382-1-atharvatiwarilinuxdev@gmail.com>
References: <20261113214721.9382-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Atharva,

Thanks for posting this. I've built v2 unchanged and tested it on my
iMac20,1 over the weekend (on 7.3 plus the t2linux patches).

It works well in normal use. I ran automated tests over 32 boots, 55
display off/on cycles and about 40 suspend/resume cycles, and both
halves of the panel came back at 2560x2880 and 10 bpc every time,
including from scaled modes.

However, your v2 hangs the GPU when the two halves are set to different
modes. This happened 3 times out of 3, just as with my very similar "r2"
variant that I described in [1].

To reproduce this, leave the left half (eDP) at 2560x2880, set the right
half (DP-1) to 2048x2304, which its EDID advertises, then start a
second program that uses the GPU. Each time the log showed:

  amdgpu: SMU: No response msg_reg: 2a resp_reg: 0
  amdgpu: Failed to disable gfxoff!
  (repeated four times, about 4 s apart)
  amdgpu: ring sdma1 timeout, signaled seq=17, emitted seq=19
  amdgpu: Ring sdma1 reset failed
  amdgpu: GPU reset begin!

The reset never finishes and the machine has to be rebooted. Since the
halves are separate connectors, anything that sets modes per connector
can trigger this.

I think the cause is the early "return true" in
resource_are_streams_timing_synchronizable(), which tells DC the two
streams are synchronized even when their timings differ. Taking the
shortcut only when the timings really match avoids the hang:

        if (stream1->ctx->dc->config.imac5K_support &&
            stream1->timing.h_total == stream2->timing.h_total &&
            stream1->timing.v_total == stream2->timing.v_total &&
            stream1->timing.pix_clk_100hz == stream2->timing.pix_clk_100hz &&
            ((stream1->signal == SIGNAL_TYPE_EDP && ...

With that check, the same test passed 9 times out of 9 on a kernel
("r3" [2]) that is otherwise very close to your v2, and the normal 5K
case still takes the shortcut. Without the check it failed 7 times out
of 7 before v2, so the result is consistent. Dropping the shortcut
altogether also passed (8 of 8, "r1" [3]).

Could you add that check in v3? I'm happy to retest quickly.

One note: my Tested-by and Signed-off-by tags were added before
I had seen or tested this version. I'm glad to give both for a version
with the check above. Please use ed@charmerstraining.com.

Thanks again for all your work on this!

Ed

[1] https://github.com/t2linux/wiki/issues/743#issuecomment-6588960822
[2] https://github.com/edschofield/linux-t2-patches/blob/7273823e425200e9f371e9272e02ebf9abb6f1c2/7003-amdgpu-add-support-for-5K.patch
[3] https://github.com/edschofield/linux-t2-patches/blob/5d3775923bf481c487ff96efc8fb3e24ecf8c9cd/7003-amdgpu-add-support-for-5K.patch
