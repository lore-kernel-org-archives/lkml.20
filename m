Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14D135675E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570527; cv=none; b=I5KouQVUPbXiN02DkOjYgSxn1TXlmF5RmKYOI61uMw6DdVwoP9t0uPIH9QBa/nPHIbXhJOauS3Adxquo1V0GMJnHNBhOf+HD09/X/DaLDJQPJryN22aJR5mhB6ewmSVHE5/NleG0XuCPjHjsgT8yXydI656+kNNwCMtDXlKhEx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570527; c=relaxed/simple;
	bh=JpTFGpyHF/Ma4ZnJDkbrqA5WxX1p6md71/a7atwIJaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxQblcgHleSfezDCzuu0AQ/PO+J4tO6A/SePS87Y9Psue5lyhe1o4tiQ3YuvYNaR+aFCY1PEorZoPmFd1rTmWe+eg7LCm7UFESq9ai0nC+vVIG84SKA5zvIkgO8XPsWLNq+onWcHS3PM8y1JWe3xIFhi0nQwWkA9Qwd363+JmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGph7ymm; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGph7ymm"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ed6d6eso8864035ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570524; x=1790175324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I052qaxrSO7MreL+XHe4B4oMuzy+yJxrtuNLZAmykZ0=;
        b=VGph7ymm+M4GpBldEmDKNqg7UiXASUxST6iv/RK3uW5Iml1I3DZODHyFZheEm80QEZ
         DAkSBjmlflA1xqH3SsbG8W4X6hJNB4H7d6yWwhFa+QWQNR+Ppd9/5Z9pNqrglKQq7EQp
         IiLhm/MyGoidToNDjK+qwb132FfKdIKa2s3rmfMxcHnolbTd9tjuceVx0GddFFGWPEgD
         sPtWAdXtepby1vCSrowIY0SKKUr/Hgze9NrehIrqDhcvWed9/M9dVZCGQRgJSQbxQmbw
         jqsH3JXtmBLsj/riPM2cXnb1NEVsRmzRpPUic0YhmMnWq9CV/uXKJ+73V79evzEfv48i
         R7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570524; x=1790175324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I052qaxrSO7MreL+XHe4B4oMuzy+yJxrtuNLZAmykZ0=;
        b=tDDRuQHg5kxwE54Io540JPj7e0yfYr4nMaTyukYYSvomz1A2LNu/JfvckY7fzBPEpg
         rpD6mE+Z+1oVKbWN6722lRzeuMUMgKsTt8MWsbcPHBpG7TTzaE8bnbwaQoB6ywNaHjfD
         5B9MD8FxI6isvYWbPpDwaJRRP+XdQot2/sxU5kKhc4Q+kPGfUTpBUiapQE97CJv0CCdO
         pMRLK69yXNF4W27UV2EHKU1o8S41gzhnLydHbNT1pTFdy1HjBVZB6VRHSw9e8fsJ/2kA
         YWpspIMG0racWca/1b6SzSSMZLXeM4R5CG3rbCl7l4xnTzPYhZx0haGQ805+jQJbT0Kj
         pkRw==
X-Forwarded-Encrypted: i=1; AKwUvBy2TyDT8/WnrukO5RRPW4ClMexn5Ia3GoZYSMzu/vt/D47ZN8LpynNe+JupJzBF/QV7jk9lYHxvVKUdFiY=@vger.kernel.org
X-Gm-Message-State: AFuF++mwFzU+i9TOVSemrQudNHgKFgsdeclPPzdQbmq472G2kxljM4X3
	JzjhCH54QNoYHCqt5bDiaJAlV/t5IfyC8tepGHuMozrYsl+WMrLXHFDWf4Q/TIqO
X-Gm-Gg: AYBFou0MPcYxV0NuJpqDqgDKJxAThVA7bkMyNGa/yH/W4Q3EZcNzQd51xg+0tf6tGJv
	DTPuatJvLdnU/6pAVzTBUYYfYyDwggf43cG/LMO5kbu4no7NmpO8TskplBIKB0HMgdYgOXudJsC
	4Uwxj5AiFYb+0clu9KCdF3w+KeGPhLaT6k1fYOnezWQwoeG0fDtAp9J/2+8MqvaWYmSFhNsLjwd
	E+RHnW9PoniL5Q1G+GcZ882VCIU8nVzM/qT32EFS4a6IO7NpH851zD0VVxa4MttMgBjCH+to7uV
	n15/nS0sChgMyu+KXvysZS6pT++g/g/cfvWJx8JgFGHmuZyPGY311dc6xchcuLYwCIJKDN37LOH
	nARDL+Pve8alYn3Xxm6RgWNC+N0V3B0jiiYVIR29bmNeYB0RK6JcdVhtY891sLOKaY7Ey73/Rqg
	ZI8riu1Cq4uWB8KdH1rBylVWKsGA9ljgv4lXAf88IC8sJ2dutncN7PQ4b8zFDX82obkUaphqLWN
	EbsYQ/3eRyZS+jMNoYyVWA=
X-Received: by 2002:a17:903:950:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2dd8dc039edmr63405905ad.1.1789570524293;
        Wed, 16 Sep 2026 07:55:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f06a30sm12944355ad.65.2026.09.16.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:55:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:55:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: James Seo <james@equiv.tech>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Fix use-after-free in
 fungible_show()
Message-ID: <d63a4830-c627-49b8-81c7-f28ca4a41306@roeck-us.net>
References: <20260916002926.161595-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916002926.161595-1-meatuni001@gmail.com>

On Wed, Sep 16, 2026 at 05:29:26AM +0500, Muhammad Bilal wrote:
> nsensor->current_state is dynamically replaced as the sensor's state
> changes. update_numeric_sensor_from_wobj() does this by freeing the
> old string and installing a new one:
> 
> 	if (strcmp(trimmed, nsensor->current_state)) {
> 		new_string = hp_wmi_strdup(dev, trimmed);
> 		if (new_string) {
> 			devm_kfree(dev, nsensor->current_state);
> 			nsensor->current_state = new_string;
> 		}
> 	}
> 
> This function is only ever called from hp_wmi_update_info() while
> state->lock is held, so the free-and-replace itself is properly
> serialized against concurrent updates.
> 
> fungible_show(), however, reads the same pointer after the lock has
> already been dropped:
> 
> 	err = hp_wmi_update_info(state, info);
> 	if (err)
> 		return err;
> 
> 	switch (prop) {
> 	...
> 	case HP_WMI_PROPERTY_CURRENT_STATE:
> 		seq_printf(seqf, "%s\n", nsensor->current_state);
> 		break;
> 
> hp_wmi_update_info() takes state->lock internally and releases it
> before returning, so by the time fungible_show() dereferences
> nsensor->current_state in seq_printf(), no lock is held. Two
> processes reading a sensor's current_state debugfs entry at
> overlapping times (or one reading it while another read of the same
> sensor triggers a refresh) can race: one thread's seq_printf() can
> be part-way through printing the string at the moment another
> thread's call into update_numeric_sensor_from_wobj() frees it with
> devm_kfree() and installs a new pointer, causing a use-after-free
> read.
> 
> Take state->lock around the read in fungible_show() as well, so it
> can never run concurrently with the free-and-replace in
> update_numeric_sensor_from_wobj().
> 
> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> Acked-by: James Seo <james@equiv.tech>

Applied.

Thanks,
Guenter
