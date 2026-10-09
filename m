Received: from mta1.migadu.com (out-39.mta1.migadu.com [95.215.58.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32244E0B83
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556828; cv=none; b=nSHawP7Ov00U7Vy7PBAc7J8117hLltyjT6kp+KDoVNTjQkTaXGWvA1W1NFhATQi0g09ltIAknLb4Fili3/lYFF5KF9EQUKMecdPhofhzrgufQsVG96b+w+ztDkSR7rpQRVkfLT6oh/QYu10MhL+vgBnllVBTC6Dd97NQDJUvNys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556828; c=relaxed/simple;
	bh=kRkhnKHKooIPtvjGsD6RS420FhxGLmWSJJncnjDWyh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G54nR9VkWzpoF1qIjkmkOwtPpW22yBrvzjZX2daXDON3OoRMSymyoa/GaTwYAK29lz7iWqX4VbXit2uZQ9IwQqZLL3xLScRgk0BmQ7/3qr1kxeT5isiq4jXo2sfJ5+2gKbD4dl/xWAN7FBpx7p49UrN9bxLzw5ogtmpKgjYoHPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K/PkFUFO; arc=none smtp.client-ip=95.215.58.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K/PkFUFO"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kRkhnKHKooIPtvjGsD6RS420FhxGLmWSJJncnjDWyh0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791556823; v=1; x=1792161623;
 b=K/PkFUFOUukOIWdwo4hyW9yeT4SuLoRiC90M1/EDJjoPDz4Ofd3gMZDSqntCnwXvZR99BbRk
 XV5kMDGO2fRdykAw2wrPRIJYoHLmZ12YBSpghNuwpwbTNdaWSwVIk8vcfr+VxiufssjlK5rZ73N
 JIz+/5WS7oimPpAJNUtQ5j3w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d1e1669455691106;
	Fri, 09 Oct 2026 14:40:23 +0000
X-Mizu-Trace-ID: d1e1669455691106
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba40832934so7317e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDQor+mkOVVDvxkipIh2hPoOinYJzHydjRNq1d+De4X/EAu7xya5diKeki5ZeeXwLMuHCP+d9yJYSMiL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv5xfqSESaPcsZXOxdJ5ZQHl7qz4+MwgNZ11/vdEeWroIdw9D4
	md28rMECZ6PkT/t1RSic2GnkuePoZxUHh5w2AKBEF33dHYoYBOsg1dYfc08vYX/ZzlYqCF1ZNox
	DunkW1wyHJYQJQ1GTmdP8MGx5lLOPTUzFfOYGMqn2
X-Received: by 2002:a05:6512:ad3:b0:5ba:3602:4343 with SMTP id
 2adb3069b0e04-5bcdf94d4a0mr81856e87.16.1791556818070; Fri, 09 Oct 2026
 07:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009132848.709379-1-vdonnefort@google.com>
In-Reply-To: <20261009132848.709379-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 15:39:41 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzaDY=tcekBeR-QQwep-WGFjpT5pGczddFFBqCeupe9Gg@mail.gmail.com>
X-Gm-Features: AclHuK8GIOxUHp6icwuslMOwolFoLyUhJLGzQM0c0cvOf4PeuIievjOYVDcfRLQ
Message-ID: <CA+EHjTzaDY=tcekBeR-QQwep-WGFjpT5pGczddFFBqCeupe9Gg@mail.gmail.com>
Subject: Re: [PATCH v1] tracing/remotes: Align field offset in remote_event_format_show()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Fri, 09 Oct 2026 14:28:48 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:

> remote_event_format_show() doesn't take into account each field's
> alignment leading to an incorrect reporting of the actual field offset.
> Use the existing field->align.

Tested in pKVM: the format files under remotes/hypervisor now report
hyp_enter's vcpu at offset 4 and selftest's id at 8, matching the
structs, and the hypervisor ftracetest still passes.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
