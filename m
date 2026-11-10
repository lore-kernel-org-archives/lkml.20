Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278228;
	b=ksGKP0MY9tyaUU7oSLK5tFhbtZnXBZdxug5aKn8DBxjjFlP1bLphnyMo0zT4xFobwiH9
	 BXz1rAuoaBbk03OBqcIJqgUoUEoXQnpIpySZLWCsQvsIdn6K2UqPmVDmdvPkdzrIoJOW+
	 ZBswxPxqj0oIsvddnKl6POoPitXwff1zgUnPMWYhd69LBiJrW9If8zSjf7mn+Rp+Eh2jH
	 DB50LeBwqThB6xgW0IxS/fzniHIyg9DeyH753zHyivgCKPS2963vY+wmEGxLU5ypEXtfi
	 DkIqaULGQn7yIoOJKqJrISTwVyw7hKSGUFikXUe4slDgaWroR5LXBM4wM83PB7xfjyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0u5+rYT3YoQNdVRNVHLrVHwDAgcFZg+rCZy8HXjrq9A=;
	b=qW3m7LmL6NztaWmRYjKN5BYW1QsIPw4x7IyFoBLV8uE+BLLDrEvO2IRiE6arq5seRDX8
	 Im4Pt3AFonDPKcNZ3ALlK+aXQd5x84fLqck/zfJadVTmQ8VZ+eVRa6I7Q6J6TKFNLiYbG
	 QeallKskpls3l75Zn2cUu9zYjHzK+TeFBpsfnrfHtSMcyi397+Bt1a27bpRMgfXQADmYh
	 ObrmFjo1689rdYYIQym+vuto57/46jxZB/6luubHXd1EVAQOOjc9mlg/7+veMHP2xkbUu
	 0zBCFUwXwbmnHB0RdZN5p2Awj2bTjwKB9ernv2iOk33zJC/0MXbeSRxCh2awzbCvUJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6dAaECO;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B2606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5B2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6dAaECO
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so3034234eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278227; x=1794883027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0u5+rYT3YoQNdVRNVHLrVHwDAgcFZg+rCZy8HXjrq9A=;
        b=e6dAaECOn/6gjR2Epz2CWid96qChCp53Z4CgbtaMyQ+W+NwKINxO3pjQfAUo6NyRrL
         EN4eirkn3aLrUaoUa0D5mGHhuLF5P3fVJMs7Ds2d4RU1Tunyku8W7hKwmru4fjkjp9RK
         yFj646Kl2OvjWCjW7yxCwmbiexnul1G2rD1McGaBGz+zVgC4e+Z6wYhdzuQdcxViWGSp
         BqMVTh2Mw5VBtAH+IbP27510ujT3adz7DHBWYE7niju0zIjTmIAXW61UHbc7jLOXUIcz
         MntNYL6rNA25khniZsfSMhG1cxULTnAllpZBTXP+qzhuTT6JGalA3D1JLn8JDd2CExU0
         X3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278227; x=1794883027;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0u5+rYT3YoQNdVRNVHLrVHwDAgcFZg+rCZy8HXjrq9A=;
        b=xb9zxtXdQF/+YS3UkN6T0/YFIu/nZVnelATxOOyjxH+2zcrcD+qvg5ME1n9TuBgZMN
         VXYg7ZciseGDb0JR+3H1W89SS2KETdBQbebLIOW9RGg0OzSNMMJankjUlskGKJZ+FFQa
         JzEZYAXkWhTRpHj16LiOEUigVyj8hk5fT0oMAWbhsV87RL8UPk8u8FgUIt+uXBQvSSJE
         yQd0v8FcS3lqkSB3ariuYOHoZ0hCMS/Rizn0gyJ1t/ZWB7jQJH1SHvM8MqgejspHEqXx
         Mi1uv1M8wdsBOUUbF70l6E4ksbSOIoccwSwrpSDZMocpHl2smhDNOlaObo5S9iG8RT+5
         63Nw==
X-Forwarded-Encrypted: i=1; AL+hErHyiyU5rJEwKIfugJTCxN/WGdQvXYn1A3ljbwtZXmBfqBL4wd8sHAq0m+sCvd0Jnt/FbXWoyF7fY4alCUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qZTnvXCYfXXDjavzRrM1aT3j1TQdJReJcV8jTDGBl4nr+4vB2
	BIUM04Uh3NsH6++eFIJSLnrnJwnbnNXaixtjUR7LClCJY6Sxi45b+LzdRTDFnw==
X-Gm-Gg: AYBFou060Ltrzx2jLTwig9dU8Fr6v0l+xVzSJXhWYjcXu4udq41ftdVCKStWFB3bMmE
	P4v5J7+w0O4RTD19ZjaU0BGs/gvxW2k/xxvNh6m6MN7hA9J1tPKDOcH+0eAvL/qz34fahz/N2tR
	sxpAzQHKntk+PeHmdieqOxM1g9O5mTIXywq++La8dVLHBY5fSKSgJMJiWMEJgaicOE1Az93ju+j
	ajr7avX4x+t1h5xlOKwMCXB/3BcZMzJuiSe/J55C6OBV+9l57PIJxR2R0vX0DN4uSLkbEwe3XxR
	Nkb9m4RrdgGdoUcqwcStsptdDw3sAqFWaul4vGjE2fHolXzscYCiH8ZAbhjBvjDXKQVSJty+/Y5
	hBaQrDfN1qoHebTrQwTQ4FAhdfRNC4nVihaykXZDnXO8hv2c42lYaiFc9WSwBYML0hnakXL4dtx
	Ch1yW4aOnNT2KvZWLa0OAsH54VBlESD7oyeYiOkySysk5GMUOzPfm2tPuk+1BKmRgq9iOKFLbz7
	HVBp94gX9J4IkUxm8VEyBkRdTE7vWrDHP3GkRv+hDwnLGlj3hZwT50++64r5uYaw64MnqVRdrLc
	hMHkuiUN/kEbMKJAJ3rOKwPF3yBSnPJR1R9enDZ5HyngUeUcMv3BTVpYq4tPFsICI+BSYw==
X-Received: by 2002:a05:693c:4144:10b0:369:f05d:6c67 with SMTP id 5a478bee46e88-3751fb324aamr1768458eec.12.1794278226862;
        Mon, 09 Nov 2026 18:37:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:856b:460b:b522:14ec])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae63a6sm2617313eec.1.2026.11.09.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:37:05 -0800 (PST)
Date: Mon, 9 Nov 2026 18:37:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v3] Input: applespi - validate ACPI property buffer length
Message-ID: <avKDS9x8NVLeizVP@google.com>
References: <20261029002227.2002174-1-tristmd@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261029002227.2002174-1-tristmd@gmail.com>

On Thu, Oct 29, 2026 at 12:22:27AM +0000, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> applespi_get_spi_settings() reads three ACPI _DSD properties
> (spiCSDelay, resetA2RUsec, resetRecUsec) as u64 values from their
> buffer pointers without verifying that the buffer is at least 8
> bytes long.  If a firmware implementation provides a shorter buffer,
> the u64 dereference reads beyond the allocated object.
> 
> Add buffer length checks before each u64 dereference.
> 
> Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

Applied, thank you.

-- 
Dmitry
