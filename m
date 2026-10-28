Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793177504;
	b=s1fmUiJ9R4WyyaAb3M4DDW+WO0nlQDbcvDes9vr02f/rQCCU8UJ9NITBIzkGkotIeSFg
	 TkQf90+evLLb9/tBCK7nUthrZuHV5c83zoqIawEVU2gk926oxOuBIzFjoi/pksmowzVyK
	 PnEu6IjQC915ehKrm+CPfGbO1P7sD4jTWbngHEVz96jzrZxc4YLyGbGlrwWMqguZA6rPf
	 dRj+GJ1JpGnfNGhh5vwIJ2Ui7UUUmT9W+NGWiqfda7L7T5tg1if6jNRksFu72MQpcorR+
	 e8V/cjEplPIdEIJu83v4nRy9BnjMW3rVv1TxkaoRK7bbAvZrtekUX0PARuzK0A8txGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1EeFooAMcisDZaa57XJjifs27WOCXklcXpVtOXVSG6s=;
	b=3iHXuwYMUUSB8s/pXwbmzO8FIpGjHCnHfWSSNTubKrEZT5fuwg+wIfTj07M3QMPrzuQL
	 9l/RmbzJ+eom2r/jA74byd4PHrMUMaTWOGct+ipBT8AwSIWmsANyI5vhrOmxIT6BYd6Wz
	 NIFmqmqnJV4IDkHlprPHnwXlKHBFabPMMQC9KQ6xt9wEpXpXqEBD1xPWikPsBWKd/kqa7
	 BPQPNfxQLy/PyI9c8ObXLGBt39jYYz2455lPpP0fU7JPRHeYDUVfpX6wfuGSPbDmT+gYU
	 60mT/PwkFo1mYhg91/ZDHwDccq6KbQR32M5ch/JLB8IYweQEHe2do1L2qASeqS4b5vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQP1Ay8w;
	arc=fail smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C33A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQP1Ay8w
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5fb79ce82so4496485ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177504; cv=none;
        d=google.com; s=arc-20260327;
        b=ewpTBK8TglLNc5SU0DqpGcaUAbNleunT9EnQ1DkBA1T+5ZMBYi+jxcXkCKyv23IhSd
         +/6zHeWG5EACGFrgu/c48SSgMexWsUk0VUxgNQR8DMG92uuPaasxVCdIjGuZhgrahzI/
         qEaelmt58/aZCNI4cgJkA7fbJvhj4TIjA4T/V+BcqIrnzgeXuLAmAEiTee3nFa2uB4Ur
         c6GdlZy2Ak/0Pcpy2jmZ1Jpvx/aOhR/dx6PcTMtP2Go2I6ZzyXcsiLVl97yGcBA8+Xnm
         NVB747YEQnyr0LK3XMAts99Czb7mfmvkRZlVLKtFTgqCzF80Gh+fEA9B9sZhXyRYGJn8
         rwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1EeFooAMcisDZaa57XJjifs27WOCXklcXpVtOXVSG6s=;
        fh=lPTFoaVvZMwzQdhWSfjCqRGY6sh77HT+UicoCJ5IxZc=;
        b=fV0YiSfDvf/+znUppA230E4OUCHYUufVN0GRXJYG2uxoRhAt0W8fSZ0w5EcoK/r3Lc
         lI0+tAVMzgkkg2ZJn/udWXDinqvFFj4d3km6snmOUl+jrrNZDsxQSqHM/MLIDlYV4IMx
         L2Hn3id8pcbkD54AnONUT8ur9LNby2pZ5Cgl5ixsg3zvxAFtsa/EiLw2p4Y1plztHqma
         Un/mTOt7QqnQEK3JIodpwRMXXIJ0gcKqIxIQIoe3rq96G4WFWyeps6RbI9t3mTWuqz/V
         XbRsx5697ID3JrPmtCb8SYgDC/oOBpYYF16fJT8/m9HrS+JrWlTnwM3OqB4si14NXs0Y
         6p3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177504; x=1793782304; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EeFooAMcisDZaa57XJjifs27WOCXklcXpVtOXVSG6s=;
        b=ZQP1Ay8wd6LeEZqlcy8Mzgpc1cJNvzlAcc9GY/nFpF5MJMCMiwbItrR7g8j5zdKbNB
         wuJbcNsp1LhPspb1Fu0Gn7zIVq7+3UwMcfqXzriyCRfYQfJfkNvM9R+qBq6YY4YfHEyQ
         +R4GAOtt1KZm6VjJWrUezRrss7HHXtxOD3OB8CY5XS/a1U1rQZ8hprmaJQ8ArM9z/u+3
         sQiQcUyvZoUefKgbj5nZkSIa9WQRX+ZKqcVhejOQZRpUiixmZD6lpNQHimMVl4iDyQfX
         zYIqS6PP6U+jBLjL7Eu3pKqMko7NbZRBZo0cMWD15/YCPzUSfiiUIb61XTd7pAmQ8yo9
         GBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177504; x=1793782304;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EeFooAMcisDZaa57XJjifs27WOCXklcXpVtOXVSG6s=;
        b=Rxt+vH1u/mYPIcPYzD+0DKW2phTsS/92X997P3Nsx6O6ciU9eqqXleTcjlj7zrKcvr
         lvQpQoYg9Xgtj9Zgumv0quG9puhJ25gaNqGa9pvMAuv/8NLguxK4GtIPo0MMw+0fQW4U
         t2qVt2WrYl2EwB1kd37WHEDaC7D3bnYO/4Yr777hX0AnlaYwHcAfMOK66sQY2I5mMJ02
         HmuAmMF9N0DPON5EI5Zaj0Em7AsuzOckhidWf6m+RMrTy/5JbKW84IctH+9joVNKAato
         m2VJdh++Hf6+MSPEela8M5F7JdClMN1G4Idtj0X+MGPOkdy+lDJtkW5Atvd61966qfAx
         OrYw==
X-Forwarded-Encrypted: i=1; AKwUvBycRJ/rbmvRAYfySRDuwwrwgQ4dnNGgAQMUKqX8fnERTRnH9Bfgq/YyV3jLqDUGcRurmXWXTE2qdbgX5tI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCPpK8EMaQE0stqnJgQFs29pyzP+UIp/czsrgAU+XV22Cns3yf
	m3PWlFCqjPZzd/m63wHDNZMMXC8cxHxWjT3N6H158C4Vjurkah5acmNBAJA2USbfWDy6Q/L/dvW
	SAo/kKCKFLp0NffGsbMAG23t22Uz08uc=
X-Gm-Gg: AYBFou0kFN5Ax60HAJMc5OjAScdNx6jGZCsAwi0cWHG3bCjJUfXL2tFSHpG9vT0m+4c
	BBsDAlIA1xW9bMtCOpp3iqznnvVZTRWCcN+N/HBJCe2lmcfA8dCDoOUn/4QvgjF6svQ0S0yJpZD
	xB5ax3qdliS9XWUSDs+l5cK2O0q25zjbZEY8SjYBZD5NDvtU7VOeGCWCeXL8a69fAJ0zZZDx3B6
	8NrWdxXmQjpbMxOciOIepctGUWPfvB850BIPRCoiE28aZbv+PDZ8sNoJz/SuNovKPLeU2+jS4Gs
	hmHQ5qcNxvdSTn3k2sNi/aEab9BxnvgpmJ/w3Yi6OI52fMWwCBKFU9LXYeimCjB/xfW7XJOzRrE
	AXAbMtoFEmQ6II7Z0CZmYPtun9lEFIPIH/lovCb1wv0UJNdJfud0s2iLD
X-Received: by 2002:a17:902:d546:b0:2e8:486d:fa00 with SMTP id
 d9443c01a7336-2eb00374563mr16912315ad.29.1793177503597; Wed, 28 Oct 2026
 01:51:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-btrfs-fitrim-freezer-v1-1-0ad1d58aa94d@zliang.me>
In-Reply-To: <20261028-btrfs-fitrim-freezer-v1-1-0ad1d58aa94d@zliang.me>
From: Luca Stefani <luca.stefani.ge1@gmail.com>
Date: Wed, 28 Oct 2026 09:51:32 +0100
X-Gm-Features: AclHuK-W7tQ9BUgY6zXhq61ZHhZ-QvaVHjA4WXgAGEYQXLZpdA0nUbFDuHHyB6w
Message-ID: <CAO0HQ0UE5BtevPHHfV9mQo5HoqzxzDDjAkj9e=pD_0AaXmSYFQ@mail.gmail.com>
Subject: Re: [PATCH] btrfs: do not leak -ERESTARTSYS from FITRIM to userspace
To: zhiwei.liang@zliang.me
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, Qu Wenruo <wqu@suse.com>, 
	Filipe Manana <fdmanana@suse.com>, Robbie Ko <robbieko@synology.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 07:57, Zhiwei Liang via B4 Relay
<devnull+zhiwei.liang.zliang.me@kernel.org> wrote:
>
> From: Zhiwei Liang <zhiwei.liang@zliang.me>
>
> When a suspend starts during FITRIM, fstrim can fail with:
>
>   fstrim: /: FITRIM ioctl failed: Unknown error 512
>
> On a Fedora 44 laptop with kernel 7.2.7, 3 of the last 21 weekly
> fstrim.service runs were in progress when an automatic suspend started.
> All three failed this way and left the filesystem untrimmed.
>
> Since commit 69313850dce3 ("btrfs: add cancellation points to trim
> loops"), the trim loops return -ERESTARTSYS when
> btrfs_trim_interrupted() sees freezing(current), and FITRIM returns it
> to userspace. Since commit bfb670b9183b ("btrfs: handle user interrupt
> properly in btrfs_trim_fs()"), btrfs_trim_fs() returns it right away.
>
> -ERESTARTSYS is only valid while a signal is pending, because only the
> signal handling on syscall exit turns it into a restart. But
> freeze_processes() first sets pm_freezing, which makes freezing() true
> for every user task. Then it walks the task list and sends each task a
> fake signal. The trim loops check btrfs_trim_interrupted() after every
> extent. If a check falls in this window, the loop returns -ERESTARTSYS
> with no signal pending. Nothing restarts the syscall. On that laptop,
> with a few thousand threads, freezing user space took 2 to 5 ms in each
> of the three suspends above, and all three runs hit this window.
>
> Make btrfs_trim_interrupted() treat a freeze as an interruption only
> once the fake signal has arrived, i.e. when
> freezing(current) && signal_pending(current). freeze_processes() sends
> that signal in the same call. The trim loop stops at the next check
> after it, so suspend is not delayed.
Looking at how ext4 handles this scenario it seems to me they don't set
the error code to -ERESTARTSYS and (from a quick glance) return the
bytes discarded to the caller.
And like before they continue the discard (which will skip/fail again) until
there's nothing to be done.

I don't know what the intention of btrfs: handle user interrupt
properly in btrfs_trim_fs()
was, maybe we should just swallow the ERESTARTSYS case in those scenarios.
>
> The restarted syscall re-reads struct fstrim_range from user memory.
> When the device phase is interrupted, btrfs_trim_fs() has already stored
> the trimmed byte count in range->len, and btrfs_ioctl_fitrim() copies
> the struct back unconditionally. The restart is then asked to trim
> [start, start + trimmed) instead of the requested range, or fails with
> -EINVAL when nothing was counted yet. Skip the copy_to_user() for
> -ERESTARTSYS. In all other cases the partial count is still copied back.
>
> Tested in a VM with pm_test=freezer. Without the patch, 18 of 20 freezes
> during a trim leaked errno 512, and 10 of 10 restarts after a
> device-phase interruption failed with -EINVAL. With the patch, all 30
> runs restarted and trimmed the full amount.
>
> Fixes: 69313850dce3 ("btrfs: add cancellation points to trim loops")
> CC: stable@vger.kernel.org # 5.15+
> Signed-off-by: Zhiwei Liang <zhiwei.liang@zliang.me>
> ---
>  fs/btrfs/free-space-cache.h | 3 ++-
>  fs/btrfs/ioctl.c            | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/btrfs/free-space-cache.h b/fs/btrfs/free-space-cache.h
> index e22443598b..cba2f5fd6b 100644
> --- a/fs/btrfs/free-space-cache.h
> +++ b/fs/btrfs/free-space-cache.h
> @@ -58,7 +58,8 @@ static inline bool btrfs_free_space_trimming_bitmap(
>
>  static inline bool btrfs_trim_interrupted(void)
>  {
> -       return fatal_signal_pending(current) || freezing(current);
> +       return fatal_signal_pending(current) ||
> +              (freezing(current) && signal_pending(current));
>  }
>
>  /*
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index ac070c745b..b02c59cbb0 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -529,6 +529,13 @@ static noinline int btrfs_ioctl_fitrim(struct btrfs_fs_info *fs_info,
>         range.minlen = max(range.minlen, minlen);
>         ret = btrfs_trim_fs(fs_info, &range);
>
> +       /*
> +        * A restart re-reads the range from user space, so do not clobber it
> +        * with the partial len the rerun would otherwise take as its input.
> +        */
> +       if (ret == -ERESTARTSYS)
> +               return ret;
> +
>         if (copy_to_user(arg, &range, sizeof(range)))
>                 return -EFAULT;
>
>
> ---
> base-commit: e17e64baf63f7c85bec209ed73f14c1b2a7e39fb
> change-id: 20261028-btrfs-fitrim-freezer-d4cba16e7e13
>
> Best regards,
> --
> Zhiwei Liang <zhiwei.liang@zliang.me>
>
>
