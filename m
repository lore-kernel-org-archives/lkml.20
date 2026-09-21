Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D84F85D0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014769; cv=none; b=S9cOZwLYHVuQdC2Z57A/yOTxvzsrYn8XnUH9eNcHHafaW6aupWJPMuhcVx/yFM+6CCxlLkFzIrB1sUbsb/dK2DuDn8CSx0e2R0W8Kb9cccA63uPc8TKUsP48vlYYdfHxR8NwntPn1HV9ZBxvIthmVh9nx+Bojv12JCtk9VrtSes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014769; c=relaxed/simple;
	bh=8SOK7b4+RHwgrDEN4NWIfgnetoUHukLJ8xvvCPI50C8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaOxfaNI6IyDw3E83uweM1sdWQywiSQRLK0EvqmQSd86rKefvT9rBt64wDJCOi1qQnUs17xtHqM3ljMZRoT+kchk5OasMIENdj7sprZsUquFbjzN2pDrn3Bk1eG4wMJT2373ENW/hNaMhlFtZl4r3hRw0YfAW9y0PmWPDlREvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=agfE6jnq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="agfE6jnq"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so2434972a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1790014766; x=1790619566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJPQyzX/Wkk0kOsOXOqZO/LlRwi3EkZiLjHZ4oL9XAw=;
        b=agfE6jnqz2GUCf/D7JzNG1SDlq+VJNbHsFJP3kV0aJMnISZdLt1pf3Cn8+uDYC+rQT
         YQDkLxPmC5WW1aODBrviW3Ug2lmzaln5LTDPGEgplTWlvmc8FCn+1xnQDOU1+kYyCfCy
         HOU0P9HqWUPnGj2f0CulTZac9m1bbxGZotBSyia3jPM6txR23iNNergfXETmH78SB6+P
         RLWDNHwWw80kFSufr4IgM9MYzX4hdJswRqfJr7+PZcHPLW/867laAMP9ElNOKgsgghdn
         przS4Q5G4U2wDNf+7YH09c5uWy20GXgOfH0+zUXvSxVTSFb0Ht0L6C5vasp6BB2/pJ5d
         HN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014766; x=1790619566;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJPQyzX/Wkk0kOsOXOqZO/LlRwi3EkZiLjHZ4oL9XAw=;
        b=AjcLr+qXeuOvPif93/vLRUDp95kBFbBOy17vIu9thIu7Hb+C3m1mPm/OD/t4maMc+7
         g85/meEqu845GTS7JYvCZhtEwWdPORQaTTJJ+Pqc8EfvcGbw4xD/1YrjwJXZATTMzbUO
         qGqYYMzzdujo66x78cEdtcQ10B4Z1DSVk3LSHEIxuxIyp036GS+oN1WMaYkVKqyolb8K
         H9tKIaOiZ4m+y/Rae0mQFTyUNJ8HGR1fU1rk20r1Ivflh1aX9DgGxqV2jmSLpIAzvRTu
         2FNwjcg1NSIFqYgMCcAdlBH77t97H2HFv3eHXG84VoV6G45ldObBeGI38qU4EGmH40Yw
         a7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBz80Vq1je05NLU/NhviLQd0gk/js3027OxmofF87PiRR1w2b2IWosWymO3mdHpM6TmGauWmac/UTxhdqDg=@vger.kernel.org
X-Gm-Message-State: AFuF++kwWVb8vijYlS5zQKJae3nWmEZv1ZOCcNE6ofU6NbtROK33UOf+
	9IPHmSpB/lxC0PAkgYQqRUNw4x+UlHdvQjY5bV+bP0GopWCZuyc3SybUneswpx5d2fs=
X-Gm-Gg: AYBFou3dSc0Zx9TeOEjldBmkmSKCtmMlbxW3pELXoOMD9swlPzlbJ4CgsTZQY22QT1J
	UI5lLTRlFU/LYk0qxUHcANwDJiV+aNNIYTuFJKVTcsCwjQrj7X7L6/+6o5oq95YM2R+aB4kWzp4
	Ds3McPM8vtMWtVmnAbTRH74QgEDHs8rXjwJ8H7cM2Y6HPXwH5si+62k6FD8CZqOXo07QV6cTizz
	D1SSrfdqXssSwpP/rHxpKHhrkYx6zMdrihNr4ilpnlMB+PQCipEnWpeaLy7eZ/soGhp0OLCwpKT
	jH0R/YHYfGUOs8+CXbfNxEdADjG2xzVXImluSlX8WshForTfVKuvcChO9O7v8l6/8HlaZm5fnho
	jo+tDDnrb0sctH8fRMashasKu+IVBYw8ca8EWGbEeN7RjkZC1eJ+g0/8xgS6ijGk20yI47B26mo
	yYs/2zgtzWXlUvS3nQ1GgP1BIhz+oeDEyuCAy/f9pQSmt+4q779dnjNY1PRit4u8hc5YINbEqXj
	xbXsu4bGJ9wQ6P79vE04G7zpUfnO3ynGZQo/LeG
X-Received: by 2002:a17:90b:57d0:b0:39e:6c69:f479 with SMTP id 98e67ed59e1d1-39e6c69f5acmr11572630a91.56.1790014766468;
        Mon, 21 Sep 2026 11:19:26 -0700 (PDT)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0320b6ad5sm4531998a91.0.2026.09.21.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:19:26 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:19:24 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 kuba@kernel.org, linux-kernel@vger.kernel.org, vishy0777@gmail.com,
 tahiliani@nitk.edu.in
Subject: Re: [PATCH iproute2-next v6 3/3] tc: correct tc_pie_xstats field
 documentation
Message-ID: <20260921111924.2cd405de@phoenix.local>
In-Reply-To: <20260919061254.39678-4-hemendranaik@gmail.com>
References: <20260919061254.39678-1-hemendranaik@gmail.com>
	<20260919061254.39678-4-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Sep 2026 11:42:54 +0530
"Hemendra M. Naik" <hemendranaik@gmail.com> wrote:

> Correct the comments describing the delay and avg_dq_rate fields in
> struct tc_pie_xstats to match the values exported by the kernel.
> 
> Update the documented units for delay from milliseconds to
> microseconds, and for avg_dq_rate from bits/pie_time to
> bytes/second.
> 
> These are documentation-only changes and do not affect the UAPI or
> runtime behavior.
> 
> Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
> Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
> Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
> ---

Header file changes are done by getting patch accepted to kernel.
Then the headers generated by "make headers_install" are synced
with iproute2. We don't take changes directly.
