Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100046;
	b=AILmyyDKSVJ0i20bkWrE2TFVvqtJkorA7C+oZ5I0SxIr0LgMkt1oY/Afplx5qVJ8lh99
	 /jvDcSSnyndJW5V+SUq6wuzpvQBdRfcB8IsKWMZ0W+wkzw3w6NtxE0ji5H5hG6mPh/+q/
	 wK7sSQ9D91LhO6/dnP+bNb9U6jSGFF2GusSI6p+BJmgqRsT5VUl/vEt7cIset4G1oBwk8
	 ah15leBkXWqdc1Tepk9hUhB6o8KJP86hyhXXLuR45IqQh2SDbmbyaWP7s61y88n8PLGEh
	 gHhf2AJiZjdU2ftHP6+HplZoKMRp1Wr6h0A0Qoe+zpaje57csXF3H1EmOJVvVTZYxjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
	b=UHuyjefXx8X0LSgADd0nYi2JO5YgAAG1lpBX16aOAuXkWlkOziy3ypV6qxEKHcoJp0u5
	 sMnkrPV0CIyr+NqY697nLIY2UKo81BOF6ynu1kg2ybYpqqGCkCzO0pc0ZpurzBlOmwKWE
	 ZaUN1Ky8gOlVZWNhL0ttdy3pl73CEN5EmRF3MLRFHcjpNnNZU+xx6gaApMW1rU7537z10
	 lxy5cecQoFR8fVpErKi0LPZCFjwFZjj3o9zysbO/S16FTSlLyFa0buZDrdeekV1ny9xn5
	 52Mv6ZYuoJNkSUBrqYd3nT6BLEIprucpozTspE9fOVRzXIrY00TcMP6OAr7q5ZwjpNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMyFd78H;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB116606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB116606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMyFd78H
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36f8cdd30beso347829eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794100045; x=1794704845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
        b=OMyFd78HssTFnnWLrccRVrdwBR8jp6gLh6pdtlOeFZ6yq/ZkZeRx166C+lgsTROppv
         dw8j1QFZpOtIJ7tTiztU4F88QAXFwfPcw1YDRv+dTTeQ2JsojR0L3quIW5G4LuTPWvzl
         IxeB1czx3AOOvax/+4BJo12uj9DiI3fuQ8KOAql9Mlp4j9l9focGESsEDbNDoC4prz7z
         twWHRtj2VkvFDmCEawkLhwe8wekupFyLFzkTJ0QNXgLhPDEeoaxgCOO+ar447ntmygaS
         SPzyjm9HQB5Lp4nsGbfeCKC+no2Snf0wgV2m9u9SbiX8fiGQkuHS3J7SjVlHR55DnmmS
         OMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794100045; x=1794704845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
        b=oBSyg+s8A+pBU7UdI89av95/ogQmQk7iL1dq4B4nWE3IorTvPjVlIee6X3D/DrBBpf
         msNPbNL74XMn0vFdHjRESg6TnANQ0CvT8LjnVT0q5AX5hquWcgJdHHJjN/f9ZyRrO6u9
         km8duaMTMtNPSeIWm3aQQ3hb7Te+zGQiBaKMcevtHRBhos1V7RRXWqToi7qSByKTNrjZ
         M/RM5ieA4I2DHdjVrOLxRPEHN2MxxRqtAkCESRzE7sCZLLGL1Fd7IJBDukeCS1JsWDer
         U7tUXjgVk7S4aaejVu89GM2M141U2713UjJ4XWD9ru9h9tphTuEO5CrfDXe6jGmVGBXf
         k8HA==
X-Forwarded-Encrypted: i=1; AL+hErE4dA719DjtdHheK6iy03W9CIMocHUkpXlxlo1DwencnEPZfwsvoRjI+Z9Bis8xhC7HByFcQ8Ax5AhrRkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rTaTRm2qjFvR7jycgBAfJXjrLBV/bc++7SlkxG2J447yHjmmw
	oKrTfBp/NVTB/m6N4aFzfs4myzQV4f3rqCIoOve80JHKy1gsGEigkg8f
X-Gm-Gg: AYBFou057czA8GmbmWB7aHPZn0fW+4AQT87b+8tUp0u339RpsLwbcIyBKhrHbmi0r4z
	wGUnqNYYNAaf/E33icYBlv0kpOsI+fzBhjIIdj9CmnhhEiCxzv4bgzgu5gCIapuDghdGiCihoRm
	CpLRLF13cw/7EmByE9++lqk/4VxcsynD7V8xIbkII5PRN19ZHEPY+EApn1xc+TO4u7xac3ZnU5p
	kLfI10/lMSNLl4S5CjT62xXkxsLScvmWafT7nl1JB4Tyd6iIvNkn6hVWXCM/+s1OdaqE+F9zYnU
	X/N6XahIvbdSrnEGXJwIiX+vKWAf0fH76YVj6x949Uxh9Q3dZRyHn5JPPe9kFw04F0d4QJcKMNM
	VlA/Lx/5lj/7Q71cyAIDWT39s/4RtNkAk5ABgDmCWli0EmUqnGtk7T6G+kvR45GbQX49rsONmzJ
	AOJ45u/bB0OcfzCPu29wN/uuSlFglOWMkGR0BFR+lStR7fwzoH8Fy/mIKqSxBgmCE8nVhVyQADv
	EtFnszUaLy5f7RhiezFZgACvoVNBwG+Eg56RdwCPxDljkphDI67UhynE/40n+H0eqaCCFGT1Xtd
	eQosh8kbuFbC1B4mpJvtwppZxWctltjHgB1AcL/w2yUO
X-Received: by 2002:a05:7300:e920:b0:36d:25e:1961 with SMTP id 5a478bee46e88-3725e240abfmr839498eec.22.1794100044508;
        Sat, 07 Nov 2026 17:07:24 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c06c61sm1344623eec.14.2026.11.07.17.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:07:24 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 32/35] drm/msm/dp: mark the SST connector disconnected when MST is enabled
Date: Sun,  8 Nov 2026 10:07:24 +0900
Message-ID: <20261108010724.4061-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929045429.A51801F00893@smtp.kernel.org>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com> <20260929-msm-dp-mst-v7-32-4b81473185e7@oss.qualcomm.com> <20260929045429.A51801F00893@smtp.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 04:54:29 +0000, sashiko-bot@kernel.org wrote:
> Does this introduce an AB-BA deadlock between mode_config.mutex and
> plugged_lock?

Yes, I hit it on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) when
booting with an MST monitor on the USB-C port (Linux v7.3 with Dmitry's
"drm: handle IRQ_HPD events correctly" v8 [1] and this series). The
lock order is the same in v7 as posted; nothing in my tree changes it.
The HPD worker holds plugged_lock and waits for mode_config.mutex
(msm_dp_display_mst_enable() is inlined into
msm_dp_display_process_hpd_high()), and the compositor's GETCONNECTOR
holds mode_config.mutex and waits for plugged_lock:

 INFO: task kworker/0:0:9 is blocked on a mutex likely owned by task <compositor>:2439.
 INFO: task <compositor>:2439 is blocked on a mutex likely owned by task kworker/0:0:9.

 Workqueue: events_freezable pmic_glink_altmode_worker
  mutex_lock+0x30/0x70
  msm_dp_display_process_hpd_high+0x23c/0x2c8
  msm_dp_hpd_plug_handle+0xf4/0x208
  msm_dp_bridge_hpd_notify+0x118/0x290
  drm_bridge_connector_hpd_notify+0x7c/0xf0
  drm_bridge_connector_handle_hpd+0x5c/0xc0
  drm_bridge_connector_hpd_cb+0x1c/0x30
  drm_bridge_hpd_notify_extra+0x4c/0x70
  drm_aux_hpd_bridge_notify_extra+0x4c/0x70
  pmic_glink_altmode_worker+0x274/0x520

 <compositor>:
  mutex_lock+0x30/0x70
  msm_dp_bridge_detect+0x54/0x338
  drm_bridge_connector_detect+0x40/0xc8
  drm_helper_probe_single_connector_modes+0x158/0x608
  drm_mode_getconnector+0x19c/0x448

32/35 is there to avoid a transient connected -> disconnected change
seen by polling. With 25/35, drm_bridge_connector_handle_hpd() stores
the result of detect() in connector->status right after hpd_notify()
returns, and detect() returns disconnected once mst_active is set
(29/35), so I wonder whether the write is still needed. If it is, it
could be done without holding plugged_lock.

To get past the deadlock I dropped 32/35 locally. Since then, booting
with the monitor attached has not hung (4 boots), and over 3 plugs of
the monitor with drm.debug=0x4 the SST connector never showed a status
change in the probe helper; it stays disconnected while MST is active.

[1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/

Thanks,
Joonhoe Kim
