Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918411;
	b=Ca20UHwH8Qd+1UwLTa6MLoEFDB/4Rx46QcDVsb7O/C0xCwHrAiUlKLZw+OhXYAeSKY9t
	 BKpCl0JWyvijA3L6vnBozwsj8y6cvh/p2hrt0LjCJvzKJVSC5Qr7+LftH8nnAWv1ryjcN
	 eWrhsR1ZjlJ5HlO1064VeF4JNXl1FhaH56Lv37L64lgr+ugLEbRao4tPFst9nDLDGkbf+
	 GFEcsM4DXNFKJWLq9nY6205e5vhx323jbdcLimPY8o8tT7poEKFcmNu4B/mHY+1S08Xoc
	 iIVKpbgJPmyGlRwz25DxGvN+6Qu0igfo2TBgbo8W6dQVLB8PV7Hloq78FUIvo06Yzhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O0O5QnW9444oDYOMuHq6ymaBPNXYeEt/n8ZpeSe0y6A=;
	b=BgWRp3DagB2t1rwmsNHjwCKQ4eGXH868Z2zVI1JFcvE5AfsNDE/f9Fv3fUVCFi6l/KHu
	 IuDeZxF8JC5VKgDYuqQnhI6dXjxgBGtvxcMY+GBkpzE1cEkxP7o3DAPpBloP9nFH+7y5S
	 sp+ncwOYv6TeUUYjzxzSA22N8aW8vTOR6rQ6X6O1QBqxrki7smV/I3Tt0nWbRrdrfuSPz
	 09sw8nAeCmEhRXMIomwGhWw0DUajBZAZrhV+poI8mNJHMod/SOJamWPY46i5fNq4VuBYH
	 3gTAqszkTQBnj7lE5BfkufzNGyf3KvfL7RQUhoGLXbAxPHnaHHmvHIIQjSTa4AdA6xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmV7o2sM;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66395606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66395606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmV7o2sM
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4919a880834so2405765f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918410; x=1795523210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0O5QnW9444oDYOMuHq6ymaBPNXYeEt/n8ZpeSe0y6A=;
        b=EmV7o2sMw8zLM6Mk9vWC4ydcQmpstfNzFWT8TIlmEqiAuNzaa8OOFUeq/p99z4zf/L
         CTN31nK7nbWPjsNUWy5Nxe3xWqx1PSfXblVP2lGfOEsVTeINPmswlmXG5MGFfzLlhGpl
         PQA5opqDFQceDefBdOKiHuNLVPy0Bs1bHzn2aDQQVeZiEF9nJnZPvJxJx4eidmMtEEEJ
         mpNQMZ5Btkoql/paSHb/TCnPAS65Sfq5Rv0TK1c4PNysrZJJz0YMMCjrdxolBCZ/xoLS
         XIfhu2j7EPIm4OOJPjkCelNZtmn2LJUgKLrFMwrnOcsLXyYSlyL2R2F4y5keajo5A0kU
         5JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918410; x=1795523210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0O5QnW9444oDYOMuHq6ymaBPNXYeEt/n8ZpeSe0y6A=;
        b=CV1N7ixH035tMGaQh4oZjgLAwgoYiHKYSMbk5sjupi/xql7ZSJRaS7vC9gSt/4H7ha
         hxqjm2vLlrXySB+iT/tzyfoS5DbuufRKSXYZKttaUdS5GSOumwx6y2UNgDFGIUZjkVWu
         pO7SasaN0ot17i1aCM9yDsG9pONCfHtTPqJXZOOomvSUg9xPYsgA57m7ItJNZEasO/Ro
         qCIUxhbFHc6xM89Uts8H6GstY76w71pHKGRX8PwT8e5lBYNKTBxPYtRtA7Hz44o4gSTf
         SvHa0wypwMOrBH16c8Td1OJL2EVB8IQ1DkJ97Ura+BclxkvzYGG2MrUCrDZhHwSKG1h/
         JUYw==
X-Forwarded-Encrypted: i=1; AL+hErGO2f8CEetTvNHF57BC3ObHqi1HbTtgh7hZgSMwOOIcXd9N+jVQvvJOszzoCGf5s4srDz/E12DwNVDBCPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eLa8uMH1fd7an1zI+eGgX4VUNqVRYxJ6FxTaPBMOF8mgYa0RY
	eTNq8KZp/6jWKQP7Ob9BWsqg6yiDs+hlFMSMRviXsnUidoXTa1hcZ2/l
X-Gm-Gg: AYBFou3HLn4KZo3tennZAwWtd4R02dQsK/BQ8JMJrP1X9IUY3D6vgo6kI8RvGAuWKXC
	Df/K6XNOU7dmmAyXysRNTpLFqHtQzQ7ii4mHzXK+5WFwYApvjeSWRIWm5760wBVAtfAtMyThrt4
	CxqWFyokQiUYrjTwHDxfyQ7Qs9Qt63e5YnA8giNpRxWJXriqX7wPp4LwUaG3lmW9rNo2R+80pVI
	4eHQWMWnDjp4ZyHLLAk/jJLUCukWSbXq8P6MTJRFqc4FR5umo0P+fnXh0YwyywiIGan8nJuHv1E
	tUAYXPKeZ9YcJm82ROvAeKdTfgGFaPCLY1iqHPInuU0aK6jYSVqWg0Fha7iTxIlauqD/vAVWGin
	UTz9R56TpTCgKwVLZ4SNZ+cqBmWxTumRWd7ICKxinHQeISoUK59yheB0oifUk4C/n0lu2eJwmKn
	fbIUtMaEZGxnBP5e2RNvGzkhampSvvKHhLiJYN3XjK4fP6nBSxiexsqPY9ZlHiQBf7g+0MDZcss
	ocs3/T97PgKocjYtVbk9gdWevAFCKLMebMEPhtwRYfwjnIl/AZ55gqYHXzl+rtEiFTtyoZmq1xk
	h5m6gNmM6AYNPI7J0dUp+oRQJduPGWAIyQY=
X-Received: by 2002:a05:600d:82c7:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb69f28901mr184215535e9.18.1794918409634;
        Tue, 17 Nov 2026 04:26:49 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783853b5sm66458935e9.2.2026.11.17.04.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:26:49 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: do not fetch the beacon of a finished countdown
Date: Tue, 17 Nov 2026 13:26:48 +0100
Message-ID: <20261117122648.1731207-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87fqwzu54e.fsf@toke.dk>
References: 
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

Hi Toke,

> if (ath9k_htc_csa_is_finished(priv))
>    return;

That would skip one beacon at most. ath9k_htc_csa_is_finished() clears
csa_vif when it calls ieee80211_csa_finish(), but csa_active stays set
until the second round of __ieee80211_csa_finalize(), after the channel
change, and ath9k_htc_set_channel() turns beaconing back on in between.
The next SWBA finds csa_vif NULL and fetches the CSA beacon again.

On an AR9271 AP, with a sniffer on each channel counting CSA beacons
heard on the new channel, in 120 switches: 3 without a change, 5 with
the early return, 1 with this patch.

The one left comes from mac80211. __ieee80211_csa_finalize() clears
csa_active before ieee80211_set_after_csa_beacon() replaces the CSA
beacon, and ieee80211_beacon_get() still counts that beacon down, so an
SWBA in between passes the csa_active test and gets the old beacon.
With a print added: 3 such fetches in 200 switches, the same 3 beacons
on the air. ath9k_csa_is_finished() has the same window.

Dropping the csa_active test here would close it, but
ieee80211_beacon_cntdwn_is_complete() warns when the AP has no beacon,
and ieee80211_stop_ap() removes it before beaconing is disabled. So I'd
rather fix the order in mac80211 in a separate patch. Does that sound
right to you?

On csa_vif: remove_interface, bss_info_changed and
channel_switch_beacon all run under the wiphy mutex; only the WMI
tasklet does not, as wmi_lock is dropped before the SWBA is handled.
250 back-to-back switches and 25 AP stops in a countdown showed no
problem.

Mehmet
