Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07723BCF7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771429; cv=none; b=K7UTEeFuFXeEtE/JtO4jTIpgKhs4CwdM4PPZHjVXXgOhJ/a00186Vf/TuDADDyqBhtvfNyd9maMJJdKkjDmC68eLBP9Hi94N35F/UATq9yhcCHyqR+gtsRFVPNWKsA21yd/bgc1Z136NI0IgXICXJVfpTr+0TuIKhYsV1+1s3nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771429; c=relaxed/simple;
	bh=FRfsH2a4E3p5CuJK+bm+CkI5NiJqU/Rf6ZDUXTFlxmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZBamF18OX/vFHxin/gvJn1ESWutWQeEWV/7daX9RvCmgUiklKFIiLlA4Hbn+1Su7B47k0CUFWSsv0HP3V/S8JBxX6Bi1ZbJ9+OaPQWVxgYbxMIfPIr1/HX4z/kFqm8RGDHQNUVFZe6WHYfTE2oHOrkbbXl22mB7AZg9yK/3ALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=UIZjwIOE; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="UIZjwIOE"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e515769d3so122821185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791771426; x=1792376226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VDPRHlAVT+FhshM7ZE+VmlyVvQPAjXCn2Is7q88QJY=;
        b=UIZjwIOEAwCKWpiF5+iz29smpdfnKK8wgkz1tbqJgXrYyiJKGF7r6nVSSrw4OgQwt1
         EpmthkJIfTHIbQ9gLbF7NcE/s4yret02X0xZpLVT1Y2QbnJ60uvjzq/qC6VG5E5f4rn2
         kyxkWIqciOLEc/Ol3FtC2EtkbDJ640CE9Vm+p2QOCldF68/GnfJ781QhLfGFIsOr0Lo6
         du3mZSTPRLkqhQJssfJJ0nZjlTm07g1grEQV943ZBFgmWmkCHLRudtYH1P22Ro3gp5cc
         nwt1PwA6N3d97F7911i8H1/wzDAygrW41ZgJwZJ+++1lCrs3Tn9iA2F4hQqfKUHuzF/r
         LoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791771426; x=1792376226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VDPRHlAVT+FhshM7ZE+VmlyVvQPAjXCn2Is7q88QJY=;
        b=HhGFlhj7GE+eoz1rl+i5We0C33UGX7pjWQ31yeSpiYnfFGI+1Yb4FDZ3zRwAJ5bzGB
         FCGBfEoeH+z4HmILky9ZTBACySF2kj4PKSqIAdOKqzH45XESqiH5wYECKgwYVin/QOIu
         XpL3V4WXy1d1miwtf4NsvrfBJW1aqTJBpwNQ7FdkJjM2tdRQEoPU4ZBqZ8UuOFj6nRtv
         irpXaHdaCgFGJM3gBxeY10Aqogfd5dKQ13NBfTk7wiVySCl1pW2IjaUwdO/ojXu8y3pc
         l5N5aGvcuWRiAARPvItWqwSCUUH6K/Z4GE6b7vl9NaYJtxquEVELWr4XjszEBS+SWcAO
         aeag==
X-Forwarded-Encrypted: i=1; AKwUvBxsSh5Rd2q7XTpUrt7cCTk6ls9YSEGyoLZ6qVmJIaY1r+SfnV/73hLp3K8aznaeX2MZiipRsl75RuumdzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFq1PPjiaSRxWwevGIjUhdTF1qg/tVT5mB5u1HyCtObdjUm9NK
	dsI6lLJa5Zx/GKH8YdFxosi9dP1oAyeVtzJY/jW7QfCQWi7uyY4apbw5AXs/xcn9sJUf/P8/bN1
	OhpmmXg==
X-Gm-Gg: AYBFou31+fcPkAvCguh2o+3Gsalx+5VssmNLj1l75iYuq57FC7tVMg5k3ytQrAHgIsO
	TAWKx76o2yyPuVczd/DcxDo5JGBdCuLUOzKScF5WopBTJzSszZ7niBQe/ypYuusGvJ3j9r7Rf41
	4QeBRIrreZoQl9Di4fAMkFdh0aSGEtzxl7Ax1g/eXg59QvT8jMPdkMUoAzG8DuzC2pA5iQNqHo2
	MBK11rGCPZdv/cx51DwTRQR6jgwxwnrL4oASNKx+OAXRJOM3To5UHuL1Wx+sLQYniZ8Z67etUXu
	OKNbU2/PD0kTybkYQqvXatlNQTK6tSHic+rGqB1idUTzkaBJrLI47z+VdHwwF46dYhyY5QULomG
	vJn+0Nd95BSs+dj/p75kAdf9ZBLrahApjbWpWtB+GUt9YbIWiA/gV0tIJL+tU0x899ZiERZttX/
	zT2Kvy/LJG7dsSfRYllsrOFuGfVcxyqrliSQet1GWDaAgRBu+Lhpb7HlMdNaZBHvD4qu5RXf090
	TyjNOIswKMQmb0OpqRnGQ==
X-Received: by 2002:a05:620a:2549:b0:93c:6e1d:96af with SMTP id af79cd13be357-93ebd24a07cmr1372253985a.49.1791771044657;
        Sun, 11 Oct 2026 19:10:44 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb986c350sm754861285a.22.2026.10.11.19.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:10:44 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Thomas Schmitt <scdbackup@gmx.net>
Cc: Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Matthias Goergens <matthias.goergens@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isofs: Fix handling of directories with small logical blocks
Date: Sun, 11 Oct 2026 22:10:04 -0400
Message-ID: <20261012021004.2105580-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <13464510581423749223@scdbackup.webframe.org>
References: <13464510581423749223@scdbackup.webframe.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas,

On Sun, Oct 11, 2026 at 10:29:07PM +0200, Thomas Schmitt wrote:
> Do i get it right that lbs1024.iso contains in the Primary Volume
> Descriptor at BP 129 to 132 "Logical Block Size" the value 1024
> instead of 2048 ?
> (Where could i get such an ISO image ? And how was it created ?)

Yes, BP 129 to 132 hold 1024.

I do not have such an image from a real medium, and I do not know a
program that writes one. I made it by hand with the script below
("python3 mkiso.py lbs1024.iso 1024"). It is minimal: a Primary Volume
Descriptor with only a few fields set, the terminator, and one sector
with a root directory of 40 empty files. To keep it short the script
writes no path tables. The kernel does not read them, but other
programs may reject the image for that.

    # mkiso.py <image> <logical block size>: ISO 9660 image, 40 empty files
    import struct, sys
    lbs = int(sys.argv[2])
    root = 18 * 2048 // lbs
    def b16(v): return struct.pack('<H', v) + struct.pack('>H', v)
    def b32(v): return struct.pack('<I', v) + struct.pack('>I', v)
    def pad(b): return b.ljust(2048, b'\0')
    def rec(name, block, size, flags):
        r = (bytes([0, 0]) + b32(block) + b32(size) + bytes(7) +
             bytes([flags, 0, 0]) + b16(1) + bytes([len(name)]) + name)
        r += bytes(len(r) % 2)
        return bytes([len(r)]) + r[1:]
    d = rec(b'\0', root, 2048, 2) + rec(b'\1', root, 2048, 2)
    for i in range(1, 41):
        d += rec(b'FILE%04d.TXT;1' % i, 0, 0, 0)
    pvd = bytearray(2048)
    pvd[0:7] = b'\1CD001\1'
    pvd[80:88] = b32(root + 2048 // lbs)
    pvd[120:132] = b16(1) + b16(1) + b16(lbs)
    pvd[156:190] = d[:34]
    img = bytes(16 * 2048) + pvd + pad(b'\xffCD001\1') + pad(d)
    open(sys.argv[1], 'wb').write(img)

> The mount option block={512|1024|2048} may set the address unit for
> reading the volume descriptors in isofs_fill_super():
>          opt->blocksize = sb_min_blocksize(s, opt->blocksize);
> This means that if it gets through, it is the assumed Logical Sector
> size.

As far as I can see, the option sets the size of the buffer that is
read, but not the place. The loop over the volume descriptors has

	block = iso_blknum << (ISOFS_BLOCK_BITS - s->s_blocksize_bits);

so sector N is read at byte N * 2048 for every value of the option.
The sector size is 2048 there as well.

> So if the user is allowed to set an initial Sector size, shouldn't this
> be used for the check in this patch, too ?

I think 2048 is the right value for the check. By ECMA-119 6.1.2 a
Logical Sector has 2048 bytes or more, and isofs_fill_super() fails
when the block size of the device is larger than 2048. So the Logical
Sector has 2048 bytes on every volume that isofs mounts.

If the check used the option, its default of 1024 would make the check
reject every record that crosses a 1024-byte block, which is what
happens now.

> So can mount option block={512|1024|2048} still have an effect at all ?

I see one effect. The mount fails when the logical block size of the
volume is smaller than the option:

	if (orig_zonesize < opt->blocksize)
		goto out_bad_size;

I tried images of the three sizes from the script with every value of
the option, on a loop device, on v7.2, on v7.3-rc6 and with the patch:

    lbs512.iso    mounts only with block=512
    lbs1024.iso   mounts without the option, with block=512 and with
                  block=1024, but not with block=2048
    lbs2048.iso   mounts with every value

A failed mount logs, for example:

    ISOFS: Logical zone size(512) < hardware blocksize(1024)

When the mount succeeds, the result of "ls /mnt | wc -l" does not
depend on the option. It is 40 on v7.2 and with the patch. On v7.3-rc6
it is 9, 19 and 40 for the three images.

Thanks,
Hengyu
