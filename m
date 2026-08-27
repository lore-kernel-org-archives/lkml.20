Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018AB3E8C78
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828055; cv=none; b=bku6Hw/H0Y3TIoPgEpj5+znzFJ29uQMWd4bKdiaH7CXL2d5uu8xJIozcppWfffGJN2v5ntq+/AQ2oWaEgSi4nBsMPqYkJR2QX/llT/4vVJ4ZiIOVglJ6AbxGS0ZmwKvK2QGHJOL5fDnHB24NdN5Cd+ehMhavLJuWbWlMO+AO5c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828055; c=relaxed/simple;
	bh=fW0M6GAPbby5cq+rLe7EDVEPDPTKOeUYuXNND5QQBpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgGz6ancVBWI/y8ZUdWX1AxWUqWgyVSXqZ8Ec+fk0I9nH6hXqc9aY1mi6BzrgqhZHonvvi+6jbmR4BNp/UUJS70qGYzJm43a5NPqlumG8OeTJeeicqMHxDI3akvT5hnrCsx8GTX5jzJMFiuSPXLGvPU5xBNQiKaxJPHLXPDMZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceuHCrbo; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceuHCrbo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso212326a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787828053; x=1788432853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkW2H9+00u6MydNAvfOuX0lwP+2vDTkZWWM1bwvT0lI=;
        b=ceuHCrboWyX98y59AD4kNV8lBn9a9+diFTOqJKi6EkPiyhmBvI/byPo9Gfjwj2mEG/
         n0KhTP+sPMkDPxnnv1fDZdN0OltQr0xiOEmrKasrSRL+RWZbWTXqffSygR9iRYx3fYDw
         7VVMAHtmXeLnQ5mBQOi9ntLAqDJ3Mm/jsPcvZpdw47Q+9SuDDmHjf28ipid2JyQ8eXuQ
         vac8dEBvMP8NuM4Bcuo0NSttdZNcL1qYiDuWu5+QMoEaZe/zvrdgGVATZUuWXzQSesha
         5NkqNfYGjq3LkFyz1qd+07tjCJR77Ac5vRngGRL/hQV7mkdhhgP1PqCh1b21clzYI+kp
         GzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828053; x=1788432853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkW2H9+00u6MydNAvfOuX0lwP+2vDTkZWWM1bwvT0lI=;
        b=SgRpyAtRd0PunarTTIo8f11wNhV4j18lcXFQI1cmH8wYKGrFU+Hyh1PRqrNZJ1kKlP
         d1hpnoo3qZ/vbanRXyr0in+C1bKqvlIqhgPcmIKu5bcKgbMlgq7qTQgOAlG/Dagc0mPZ
         e7LQqlCtlpqU/loObDrYDE0KJvC5J4NxTzBgz9/ZDAoXV0NEJyRqy7s2KuMTsmrGJEK+
         YF9BthmlmI64w1MMDch9XUxOtCPiDQSr1zD6JW/m1O67dWISzd27V0NijKunL1RMkEJ6
         xJDocUo628liVq4M2Xexaf460BzHFMiZ2mqX/S6Jgi4El8FOFzyKmfrx0Q9eZB62llyn
         6/ew==
X-Forwarded-Encrypted: i=1; AHgh+RoSIBG65ucirKBL9ICHQ8xhY9ZQETqUDu7zd54zuDzS9T0ZpYOEmQf606kluKhduc9P9evJKIw4RtietJc=@vger.kernel.org
X-Gm-Message-State: AFuF++mPYYHyWxRWvK8jVvLdrhgjQvdwAAb81SnjTlcWDpQpz4jAddhq
	eB7GWL2RE12XXeBTHkoPP4HE9LuQETPwpw09lAw93VKm8iEBF5WHq6Hw
X-Gm-Gg: AR+sD10sto9uVoASAPeZB4Tt6We9FB/bdDHLL0P4XttzWWayK5vCflhg7yaCi68tVGY
	5FrlFWPLgLiUT/4bgmRCeuEw7aHiC2E+xbPwpmRMUC7us8e0b9anzwedpCQgopaAFoi0IVQBhPa
	q0zyVpmmJ3DDLa7AyMZ8wqT/J3HRhJv2+2Tft4Y+6nOVJKxH/7mcFK+RB5wg0QmsfczNPIRLxtn
	X8I41u8ZtJTd/HgK0eL5W62DdYAa2DC2D1tovg/FEK6NZy8gecdu+5M4pTr9rtO1Z992HF0Jt63
	0SJ3f3Mw3CMsw5Ygn8OEFiA1KsVZzK87IOYkZ2UPqaQC1bvBwMK+hdyQD8REl2LPYuTdtOK3w1+
	CoVxpWR9eDIKscisZE9jhcOuYEeZgPhpkez4A3jBvNU+T5sDMrPz16PWJaVk10IM/Ra9fwFqILk
	N5pKGvB3WQlkXoi8nYxZV2oor8HsXqU1EBZANPo5UDwhkD8irg+EJP0Curl/+T5T6eMuEt5d2QM
	M6zKEilvtpMvEUb8O2xiqLuiZP9+PYXQ1sE4q00
X-Received: by 2002:a05:6a21:e082:b0:3cc:c7cf:5a44 with SMTP id adf61e73a8af0-3cf7596a921mr25262336637.2.1787828053213;
        Thu, 27 Aug 2026 03:54:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d96d:bc4e:98d7:146f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm27194403c88.5.2026.08.27.03.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:54:12 -0700 (PDT)
Date: Thu, 27 Aug 2026 03:54:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-input@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: drv260x: Make vbat supply optional
Message-ID: <apAWXyPRtSe0Uk9_@google.com>
References: <20260826132211.3341936-1-mauriziocasciano7@gmail.com>
 <20260826132211.3341936-2-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132211.3341936-2-mauriziocasciano7@gmail.com>

Hi Maurizio,

On Wed, Aug 26, 2026 at 03:22:10PM +0200, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91L firmware instantiates two DRV2604
> ACPI devices, but does not describe a software-controllable vbat supply
> for either device. The generic regulator lookup therefore creates a
> dummy supply.

Yes, that is how most of the drivers handle supplies on ACPI systems.

> 
> Use the optional regulator lookup and skip regulator operations when no
> supply is described. Systems which provide vbat retain the existing
> enable, managed-disable, suspend, resume, and error-unwind behavior.

regulator_get_optional() should only be used in cases where supply can
be left unconnected in normal use. This is different from this case
where supply *is connected* but it is managed by ACPI/board firmware.

IOW this patch is not needed.

Thanks.

-- 
Dmitry
