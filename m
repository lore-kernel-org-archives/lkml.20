Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB093B42F2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635876; cv=none; b=DqY/LQffOs7dD0QcGmLOiwlWKpYe5moyV09b9E836B8VkE052Q1MGCf2AyIcxkjMD2wJDt14lKLY9SfjZuE5oAGUow4VK18NZbHnesQR94yDpEUr4D9cXr6PntZrswAF0eFA/MOGtpAfLByEK/nFnRMg2XF0TjJ73vKyYaydAWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635876; c=relaxed/simple;
	bh=gTBqUrV+07AI+h9nMNDMnAVyF5h5BWKKqKwKzPTIRXA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OutEZ7nNvRHTlnrhmRG5ZJHMo87zIzVB5sdxQZBnFkt/h4NUfJQIUBDDhaAAOwSwlihrnfKsrsnDwGMzEwMKuUGMqMBSNZF63WrUt+m8+KXNBRm/Sh1BuehpRc73Ebvb7nPlz02RQ3NOm7Wra7LStXmQr6eVBOCCcdf2H4kDyvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9Wlfu0A; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9Wlfu0A"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so340158a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789635874; x=1790240674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d7R+8fcQM+tFjDeDETDeQ+l3bM1rME/G0GiaFRaWbMg=;
        b=o9Wlfu0AzOJEGy2+97BbOUxg1VTJ578bsYjNJpj7MBRceW4W//aifLDJI2bLuYIEWL
         +IE0COUvYuWoYHvyTHcurdYyMzpmX2/MbNIV6oLq3u0Qk3Vo7o6kPSf3CHFq3H06uyvF
         kwpuL+5f+OxJbseIXvKG77JuicqP2ofnIT4nEZWJrr/oqZJd4JPFqkx48ZNx322Eu5So
         1o/veEwI0dHlagniqtxXxOkqLMU7Z6uDojeS8Xlx1ytyoGbEEY25/eMMe7ub6DxqO74I
         PkTHkpITJk+oKJg42w75gk4i+499mnn3ObJXp9vAhGZsfvunHHtolLeMRcIXYLAKZK3n
         Nz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635874; x=1790240674;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7R+8fcQM+tFjDeDETDeQ+l3bM1rME/G0GiaFRaWbMg=;
        b=wuNxjF581uxz3lGk3NlM5TX9YC2h4HtFIO20MOZhTqNMhuIbLB9r0cu9ZXg0972ku8
         LJNFBHZZ5XV/wxTW7pZwswnwDG3uhmBAVon24ZQxQjKw/BD/sqKWF3YFBRaCerJGU+hw
         XJGh+jpMr3a6ArlvomnU88jzZmmFBpr1fG0ftR3fF6Oh4mF0cf2EhOdfU0F//5DJClid
         9Rc2qFTBQ/6psB0DVsvFpN1ZXUcgf6qhdzAViJX/xw7N6AZ2LeDGWVSqwVzx9s4Mszim
         IYkN0ShV5XGWiG5jAwhVCL0PldISrxusrt+y82ky21dhNDqf/yySC+eM1k0WgbR5wAZc
         nRSA==
X-Forwarded-Encrypted: i=1; AKwUvBz4HnFRAeSQC0BBEEgk9mmP5Y4RM4Ab6WGEK1ijyP3W75Kc7AWDdIme4NnHn2AcD1WjvUu+1j9Ho/SW/Fw=@vger.kernel.org
X-Gm-Message-State: AFuF++lWja/0mDaEU/QOH6VLn2I7S+/C1dnGrEjT6Y248sDG0SnXLGWA
	8FjLpZWUW9l2YVCsNEPSB2LGpK7y3d7SV53vcAqYP+gK3F+AFhR1FNVI
X-Gm-Gg: AYBFou3OVmAHJN7JDy713lodC8EvqAwhFuWYlrJVtpSqlvm/gGK7q4F30HR062uVz+6
	s/ZS8nrVd1Ese0eAZK/TkA+uDH3ispEE8Q6Rpo2ZR3eULvz6RWQlaqCuLN1ZMXrjZMSdZfcVEjM
	c9u0H3pRcH+pW+XYDzSXMdjqGUkumSiDbyLjQMHs2ApfdefTsgoV01NPbZaAmpp6nkCw5xAfgf9
	Db/8R91LYs07sSb4uQD8cZWCH3VCcqJ5qg3bjZ9ISb7J6/O1OFH13j1r0dm3ZtBepIAsqACynbZ
	TThcmpNC4wo9NB2MeXjIloRj/Y0gdZSgWiuXDPMCke3YccsmKLEHgN9WTxHwNSX802tE9IzZ9hk
	sE3xcbDS4zNU0JeM8nxkKvKkKu+7D5yppnYkmo7Z2auT1k0XnUS3M2d6iJp8eP8yCZCRbIueAXP
	roqqIDTBTKwQpdTALSeDljkI7vNLFoXfbXE2kNaHWYZS4Gaw+ReGkPOhHSWS50jt4yfD/tbTDbg
	J6GN10vBCUQKtYAxA3ijfg/zIo=
X-Received: by 2002:a17:90a:d88b:b0:39e:3baa:bd3a with SMTP id 98e67ed59e1d1-39e3baae393mr4555103a91.12.1789635873881;
        Thu, 17 Sep 2026 02:04:33 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:1957:7164:90db:6fdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b22b74sm13727420eec.30.2026.09.17.02.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:04:32 -0700 (PDT)
Date: Thu, 17 Sep 2026 06:04:29 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_0/12=5D_perf_t?=
 =?US-ASCII?Q?ools=3A_Annotate_fixes=2C_stdio?=
 =?US-ASCII?Q?_progress_indication=2C_debuginfo-client_in_more_places?=
User-Agent: Thunderbird for Android
In-Reply-To: <aqsX6GfGu9QnqX5u@google.com>
References: <20260916114740.48230-1-acme@kernel.org> <aqsX6GfGu9QnqX5u@google.com>
Message-ID: <4A3BC1E8-F362-43FE-9C79-54E391150FFF@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 16, 2026 7:27:52 PM GMT-03:00, Namhyung Kim <namhyung@kernel=
=2Eorg> wrote:
>In general, I feel like AI generated patches are too verbose - not only
>for the cover letter, it's about commit log and the code comments=2E  It
>adds more burdens on the reviewer side=2E  Is it possible to guide your
>agent to produce less messages with important informations only?

Yeah, on one side it provides more context and explanations that can be us=
eful in understanding new code and changes in the patch series versions, bu=
t gets tiresome at times, I'll change it to be more succinct=2E

Thanks for the feedback :-)
- Arnaldo 
