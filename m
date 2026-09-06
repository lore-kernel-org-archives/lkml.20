Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34223672A8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788711948; cv=pass; b=UURtY07Pey1HoGXRGCfXKDepBAmoZw2O8QyS5DuJL1JzRyg6nj5V6suDsotjwT60VBQL4PP5Di9DsyekGyvad90WrIECBSyd/jqteE9AjGCp7dQmayaYVUFBy2JIcMN6xg8vthwT3eoFCA+72NZFjXykf5eMtR2Va+2+ZVcLwGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788711948; c=relaxed/simple;
	bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqsNK1ZH+Dm/ZtC1bqlSRXDvn5Dlk+L134wL8WrjneZqxDeI4/yHDlxQ+AUF2zBu57hHam/liioJGocirLa21xeLPlM6aD9WRtI9z/d0yS36ZF4MA81ylqYCphzPyp3aZWI5qhRPI2fMyLEaG0O+MJHdOW3VhWWpEjuSPa9/JBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixKiGoY/; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixKiGoY/"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-46fdd5884d0so866236fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 09:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788711943; cv=none;
        d=google.com; s=arc-20260327;
        b=jKtW5oAPji+ACkhY1YG0+vIuCPRJc3kEVrlxS3fS0acUO1M/vvOlnH2L+cWvzU6jSP
         il1RmZAjKtS05JlKOVNkNdirnNmQn+mS1DT0HfwdzTZZYSBoZa80JZjnO11/5yIf51XO
         7JpkDOZOqsOiQj0TUBCDnYPfxmGlgEbvbuyl0OdEWSe2zGCA09guh8VzDEunuaSU6q/J
         E65VZcOWJlej3ucA00Prj4QjLNi7N7N3epcviiHx0s4vAb4ZoMhkByAgWCa9ecvEoyp0
         4RVNInr8d+1lBI9Zim701BAmiykTEzxmpJ5BkkvNNXCbBHT8kje0b90aT6pvQjUktu7F
         xdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
        fh=bsMpTr050S940DoLAXoUjFEmUU4yZhoffJoufyDNi2Y=;
        b=cK+rGgf+msqXt1hf/h8i6bjdfSgunNXBgql6GDPtzHw9tTAeHtbZmcIirs5YyMBF4S
         8DyUM21CFrBAhrDT+Dq7dz2Lo/YJP1rfzXuvkSBOmU3sKv/c4TsXGUVt45pivZqf2YBO
         DtcDPnu/GewHD8TRuF8pw0I6oHMGZcORKXyKmM2HbkFxrbZymECDMNefMWfOtKhM7PrA
         sYqPqXbLtAWDCs+dOyderQf6KkcEjDepdZhD7Mxb1SL/ysOAQAAnx/4oIKXYigMyfl3U
         wFOEQAzS0pb+oLBrjCE2vibRRqAho0iQv5psc4IqIAqits7VBcyG2O4jLumtfpYVaRhn
         6YIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788711943; x=1789316743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
        b=ixKiGoY/P0+kNU6+ashWjq7fr8bzVKsPutWbZAxhf8tmOSrwYhn5TsZInS0la/1b6B
         kp4AnpJjt9moz83ssBBn5VHHvDNF0THsyFsWBmEWcrnjlU/igKIy/VPFAIZsVUf9BgnM
         bUYiqpDOUfWfzyFKjtk8ZiI6vZOzrJefkadZMVBoojh1J9JjZDDdPHiM9LTOawJyzN0K
         pQM20rBHrPAROzWSahU8w3vtOvK/M1R4zIKdfJfGMtTp2hGCBUsHe+2gavbUC0YebbTO
         QM8m+F9gb6wdOH60yTU3v2OO33Wfd2Yu4j6kzZuVdokq667uxhSc4BJ2vHm8atPhl+/E
         35BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788711943; x=1789316743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=674vgAKd/RTrOQNbWGbCczHU/j07DbjYq/3YPxgjVqo=;
        b=BKWWupSF1jyMdL02WU/3sQEEELusDAEGp6VbKRdu40P4UjlN+Dnh41sK9DDemL2bx5
         v9E4Z2/UOkdAGsxl0FYcb1gjAM+NXVjVI3Pzqu/+6oSp9wletbYT1fvg3yOSX/MEAUb2
         2zdYM4eIIzGfCFPGY09/jh7dU1+hpLoshZlhJMXxU72cY8NrcsP9vwAuB59F1IW9WYmr
         5npoArriR4qJc05+OQyf0LM9OCjk1tI1FNxm3JC6ZIBa16lD6EBYh1RJgze94ZfZQTnl
         cW+kzlpFdVdAFIKjIzO3hkHg7NEhE32+38ROC8fzQx4/oup6B78oP4NPoyWs5MfKv13o
         PXbg==
X-Forwarded-Encrypted: i=1; AKwUvBxCkWLrByOQsQ8cWhUm4W9jYNscIPx/jANAHtXkGT//JaD5+PqS07K8Hu0rVk5A2CAgPOWnICkfOGLj5XA=@vger.kernel.org
X-Gm-Message-State: AFuF++l/ggolEoVdEX3EjbbN9YRp8zL3gNuljy8KttkklZ+YR4gmJUdy
	grY3feVIz5RTYYpfCpqKbvfWJbrxip0jAe+K0EKdgl3uuj4qkghRna7Jskg6fJVU2sbJCmUtigi
	g+3mqiA1TWRqwE23fW65pE003xitpajw=
X-Gm-Gg: AYBFou3xvwPnJKx85cvfAhGdbQ4pi0xDJKE6ISwKo1PTcsRsaq3Bc+YnXqaMO+Bdyrs
	kAptHnp/it9gxvXM2L6biSmfyfjGpNxMtfFjbEjauCsNwt+4kwKLW3tDYf4c8hZ54QtPqVFXQRa
	rSvlPQuN5uTJqWgfv9H9wgcAy/m7XKo32RatxZjocqBuT8moAk7JjEFPl57v2+63ZSfA3jqugaP
	bIOAbeQ+8BiUKyu9qsHEZmG4bF4ugYr9CJ6xpPlaiUcsdMwY7tDil2QXhcAwo7AC+TqXy5mqUVI
	Nr3TFBL7fEEkI9PafDYEjDzYR09kMGEqP5kLw0B7tzMpPCg+6lvs+sdX
X-Received: by 2002:a05:6870:aa9a:b0:449:bccf:bb67 with SMTP id
 586e51a60fabf-4755157d71amr13380565fac.5.1788711943580; Sun, 06 Sep 2026
 09:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com> <20260906162010.07781ebe@systembl0wer>
In-Reply-To: <20260906162010.07781ebe@systembl0wer>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sun, 6 Sep 2026 19:25:10 +0300
X-Gm-Features: AcwNN1W60xdRW7NqkHxR6ohHNio2xhsVYb3KM6Hg5RkJycqi7OOnjevUnUQBUhM
Message-ID: <CANpqX3aFVx1KgF_THty7ba_DVZf869cto1F=qkikjjSCjkueEQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] staging: iio: adc: ad7816: Fix SPI read operations
 and VMAP_STACK issue
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi Joshua,

Thanks a lot for the detailed review and for catching these issues.
i apologize for the bisectability breakage. I now realize that
removing buf and missing the lock declaration in patch 1 caused the
build errors.
I will fix the commit splitting, adjust the commit message wrapping,
sort the includes correctly, and add a proper cover letter
description.
I will test each commit separately and send v5 shortly.

Thanks,
Abdelnasser
