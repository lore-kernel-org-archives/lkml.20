Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979238;
	b=q+7pUkWQ7gwKTpJ6nuTlNZc2XcSNoLWAHwXWls1MapqkXKc4qfeij7rULsvFdhASzcL0
	 G3tdYjtphWelS0123r3WoKcBbOmyNga9qgimZPHQgdIz31hmF3vmhhiYiuEAncP5g6lyr
	 W+pGs6NNP53Wd3r6NVGwQIP9A/+b0SLdfLpe6aVBBptL2oe3JUZOeU2ZrV48szaePIw40
	 vSh21ld3E+yuIqb2tNC8SlGbs0LrdDytY+f+Yh1myFI+3rZEuLLq5Qapg6U6D+/2f0oNt
	 /xbaiHKi6rZITrQ3h24qN5cywZ0aQwU8PvnRcy5NeN0YhvTkoEBOfiQOOymLWtHplmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979238;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=xnFBbA5O9SNG3bMSQk3PMw7u0MrJOeyJ8JatdQVxblM=;
	b=EO6n/PYWCVJ5df2veR9172+5zvSTtCX+xNbHiNxk0rmtj/RwbfW2EmzFbo8KVX31CoGK
	 u7X+LUzif1hBzO4Lgj6JqZBYjlVPx5w5+uoJxNjpEfTl8imIyikZNKff2NAF74J3rQZUx
	 A7FXv4skO/wRlAhfJLCpEE/TcbTt+QvAy6UudHRJWGfZH2lIhPGDJTGC25+xJUaBM/52O
	 GyLpQFtb2q+Oub/4pZ+sDmmZqMGLq51iRIS0odxOOqhr0Q7H5Q99An6tpUvMvzqMCtehN
	 PEFHaZXRAuW1JMhugY8fE/6ckcWTZsAxymmgubVaLhomgcvDCvgl1fnrkUTOHVfA+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vAKdOg3E;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0C606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A0C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vAKdOg3E
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GFi60cn8i9cNl144LnrbpfpPJhWJ4UiTddospvWh4rs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793979234; v=1; x=1794584034;
 b=vAKdOg3ENFNMJVI6vA/NFPoNAYPOnWMT6wen/WtleCBtAy6WvbGoH3YNNrEtn0RWZj74hJm4
 nbwNl9K5//ex1VsjpyrUt8l3RjnTiz6z9xaTqFniwy3VFniWBtuIh3oDNkSKLyCRUIfB2+woak/
 93lgqaxIumr3Oh8Lb18/90Nc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 570a4a2ffed2485c;
	Fri, 06 Nov 2026 15:33:54 +0000
X-Mizu-Trace-ID: 570a4a2ffed2485c
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 15:33:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <0dbdce9823a6ac3f68640fdeb3b3d1197b04fa58@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when
 failing to leave LPS state
To: "Kalpesh Solanki" <skalpesh942@gmail.com>, pkshih@realtek.com,
 kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "Kalpesh
 Solanki" <skalpesh942@gmail.com>
In-Reply-To: <20261103031434.14449-2-skalpesh942@gmail.com>
References: <20261103031434.14449-1-skalpesh942@gmail.com>
 <20261103031434.14449-2-skalpesh942@gmail.com>

Hi Kalpesh,

Thanks for the patch. I know this is already applied, but I have two
comments.

November 3, 2026 at 4:14 AM, "Kalpesh Solanki" <skalpesh942@gmail.com> wr=
ote:

> diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wire=
less/realtek/rtw88/ps.c
> index add5a20b8432..8dba60f3464c 100644
> --- a/drivers/net/wireless/realtek/rtw88/ps.c
> +++ b/drivers/net/wireless/realtek/rtw88/ps.c
> @@ -166,6 +166,7 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *=
rtwdev)
>               rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
>               rtw_warn(rtwdev, "firmware failed to leave lps state\n");
>               rtw_fw_dump_dbg_info(rtwdev);
> +             rtw_fw_recovery(rtwdev);
>       }
>  }

As far as I can see, this timeout doesn't always mean the firmware is
stuck. The comment in __rtw_fw_leave_lps_check_reg() says REG_TCR is
only restored once the AP has acked the null frame, and 3a2dd6b7cadf
("rtw88: check firmware leave lps successfully") says that frame can
take much longer in a noisy environment. That is why the old code just
cleared the bit and warned.

So if I read it right, a busy channel or a weak link now ends in the
WARN() in __fw_recovery_work() and a full ieee80211_restart_hw(). The
watchdog leaves LPS every two seconds on an idle link, and
BCN_FILTER_NOTIFY_BEACON_LOSS leaves it right when the AP may be gone.
This also reaches USB and SDIO now, which had no way to trigger
rtw_fw_recovery() before.

rtw89 only recovers after RTW89_PS_HANG_MAX_CNT failures in a row.
Would you be willing to send a follow up that does the same here?

There also seems to be a path where the recovery never completes.
rtw_leave_lps() also runs from ieee80211_set_disassoc() through
rtw_recalc_lps(). If the check times out there while the last interface
goes down, or on a suspend without WoWLAN, the queued work runs before
drv_stop(). mac80211 then never calls drv_reconfig_complete() with
IEEE80211_RECONFIG_TYPE_RESTART, so RTW_FLAG_RESTARTING stays set and
rtw_fw_recovery() does nothing until the driver is reloaded, also for
real firmware crashes. Maybe rtw_ops_stop() could clear it as well?

Best regards,
Luka Gejak
