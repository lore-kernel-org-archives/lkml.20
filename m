Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079732;
	b=lRitEuZGsV5bLx2Cefh0F9MDxrBaXp2AWQVW/5ZRwSMJ4E+ulBhgznGcyYe0iDDvVMi/
	 yHF/1miUDUVhQ81dhv/on1PExMhZRoBnH3GVKkwldclRCHOlH67+wXuHpBoFSc3HC+S2d
	 hf4jtKHL4v7YXD/Md5UgowkUcbg7WjHTRS7ZqP82UoNjxEsbG/RqDSMMlsuSZEmD0FixE
	 H/krEh1523Nq8sasdCQHjfq8+lwBrxNzHY+JM3kxOQv39fi6OVNnT6JqvsnmlTVFz5w7F
	 HtEdV4RYMHnZKzVj9xoqs12OcKYy1NWbJbOmg5fEn0CsCED1lcuutxEhPcMdDPJupCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4YvQ88Tw3BpTAX+GwccgHZpr8xDWaxtWSxka8yipfg8=;
	b=LynLFmKXVSutUgmcG2q4kTpEYcmLxVXT7F3xdtZtqmocMt0NeTH34Zg9A1si9Bfac/VH
	 +LYBC+OUh2+Bmnyt9SE3guyjQFAMYi7zSnyCLSbaq3+PBob97Ep/oSMdcasZkIJLowj5o
	 CsKPbURUbsz+1EY1p60UevJPHCUU1kXNNTyQ5+d3MYM6PLW/TmrYul+Hra5qOa1SKN8KB
	 MLUfODRVezwEG0kZTrvomErbYJqKtBdeNTyQrCUTZFFIBtgXFanrA/lkVyywioFHYA8dp
	 HYa0IYswQlMh4rzGNFhjBpWV0WpwrCc3sLD8S94f6+zLWFq0Cc1RjCzafPovnnAGkYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YO5yP8qC;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70968606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70968606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YO5yP8qC
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so50935eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079731; x=1794684531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YvQ88Tw3BpTAX+GwccgHZpr8xDWaxtWSxka8yipfg8=;
        b=YO5yP8qCHZt3E1p7kirdA3BaQ/nmYjlsW6tYhTjLTm7hN0UMx49b/eckfBQdj9h3Ob
         Iwq3aZM0S8PHvI0b/7XMozBn1SEYbBxVgnaPCgkEc1jBWlf6LD3U7QiuAlAs5yI/STBA
         QnpBx9bE8cWbQ2Vq5EGysf9+rAue2S6KdRMwBrdl4EwllbxX+EOAZ9hzgWXQooFCLGnl
         QbqheRZMzHkt2ye2ZTjB1YXBkH/VNHKIiNPWpFNYK2wukaVo+QMth0DRU9W4nYWCE0tW
         jU9JEDMea7K3oxpyJ4cyVopstrPMVs5j5nz8USvb+UymAO5RhaiKc8Wx6ArBEWv7Tiuz
         Ax2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079731; x=1794684531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4YvQ88Tw3BpTAX+GwccgHZpr8xDWaxtWSxka8yipfg8=;
        b=DG050BMo4PEraU3AP1G8U9pbVfDoxtxU/59PoXHHT52g/qNu+f7zQXqAd4uU55caaV
         I7DeiVSmzWGNp2I+8lRIj54CVcq+07UFzIMxXooV369gR7+s+d0miiEsJnP1zIRUmJ1X
         bk4fDsau8rAyEZARRQXINmn/BbtKldV3Y33QbxcO3yAHdzdD5aRAQtlg7+RPmn78lAOM
         y3TldG/MoN8S9s7Mu9REcuU1MhL5fBiD06zvUsoOkJIYAzcRf0aJU8wIGstKtJDAhkxA
         s6/j1yhsxJrRogDPkVF216sfsdl5/+5zJruX/Pan49oP7rbllceQ9nu74tZDD6kQOYOx
         vIuA==
X-Forwarded-Encrypted: i=1; AKwUvBys7INSobL+nx3uIneQZIcEMt0OYVdVtk4zuFCAlbf+kl6WF6wPKUXE9dLWCzcmwFCbsCTIr6AzWDZrDyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+NFm4EL1h0qbfJMzPGQL+aVIPoq8vwMrw2GsHb3rTn2RcRV/1
	BRK+OcSRk/T8SZE8pU3KbcjTyB7LF4otMyYmzwJP6WvWzuuizfutmOpc
X-Gm-Gg: AYBFou2nYeo+esyHwsfRZDDFfyfi+/s1+Sl+9LuboooYh2scauCgyteTOrYK07PVJcv
	VJR/ITkxqsk8IpPWgQkD/rA8a74h1O1GITlu5+BAL4BJdwDg0nWd66AtK8y+Q+3uN39d7FU2Xvz
	j/F5ub8rVgeTvDzfM/JL/Fsr2jmrNDIbW630MC9O0j+CPjWzJG1fk1LlWmd7d3dXr6SdYQYaax5
	h5Nu7Q3wKeweUFNLAEG4SN7K53/Z+Hq3b/LL+K/e/c3zZyd5eOSZaMkgZfQUywkWX+e/FWJU0Bd
	I0UzLj+jWG/xDJrG/wuz2KkyX7kSZyGYobATUv5ad0zHN10INYXl9M+fnXCLrpX902wmBPapI/L
	9K6i9v57ZqLAplMeMTrjQ7+V44rJ9hn8YepQjaQTTwjnVZ1Nn5dGh+X8kMdamGg6Uu7pWXQ2sJw
	y1lcCXOD7tf2Qi0Lnom3m/SWIQHBu76DMhijrZCICQmhSyPDRiRdBaU97I9nUshbTYTE5ajr1hP
	RrXMU3wJUMsyJYHxr1cdu66MsSO7bYhYg5djGwtr9HeS8x23tW3/OA8hfjgYfu2OCVf/TkWufz7
	33jL611KSZjwYpQnsz1d+JWhCMydYJ4fT27Tbdevfl08qoQhqC/w/VJKeX6ywGYPGQ==
X-Received: by 2002:a05:701b:270d:b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1b25d30af61mr9520523c88.14.1794079731268;
        Sat, 07 Nov 2026 11:28:51 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm551856c88.6.2026.11.07.11.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:28:50 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Sun,  8 Nov 2026 00:58:44 +0530
Message-ID: <20261107192844.3908575-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
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

Hi Namjae,

I sent v3 of this patch as a reply to this mail. It opens a named $DATA
stream with ntfs_attr_iget() like the other attribute types in the loop,
and keeps ntfs_iget() for the unnamed one. With it the image that
triggered the WARN mounts and walks cleanly on a KASAN and lockdep
kernel. Without it the WARN fires at ntfs_attr_make_non_resident().

About the lock ordering: I checked the code. The comment above the
__filemap_get_folio() call in ntfs_attr_make_non_resident() says the
folio lock nests outside all ntfs locks, but its callers hold mrec_lock
when they get there (ntfs_expand_for_write() takes it in file.c and goes
through ntfs_attr_expand() into ntfs_resident_attr_resize()). The read
side takes the folio first and mrec_lock inside
ntfs_read_iomap_begin_resident(). So the two orders do exist. This is
true for the direct conversion at the top of ntfs_resident_attr_resize()
as well, not only for the loop.

I could not turn it into a hang. A reader and a writer racing on resident
files, also with a delay forced between taking mrec_lock and the folio,
completed every time. So I do not know how reachable it is, and I did
not want to change the locking in this patch on a guess.

If you want the order fixed, I think it needs the folio to be taken
before mrec_lock in the callers (or a non-blocking folio get on the
make-room path, which only tries to free space). Tell me which you
prefer and I will send it as a separate patch.

Thanks,
Wahid
